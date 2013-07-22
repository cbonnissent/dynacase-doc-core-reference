# Recherche de documents {#core-ref:7291dea8-a2db-46be-8194-bc6f100cc467}


## Recherche de documents issus d'une même famille  {#core-ref:5954b300-a514-4a3e-966e-dac5cf07950d}

La recherche de document en fonction d'une famille est réalisé avec la classe
[`SearchDoc`][searchdoc].

Cette classe apporte tout les mécanismes permettant de rechercher de façon
efficace des documents.

Exemple basique : recherche de tous les utilisateurs (document de la famille
`IUSER`)

    [php]
    $s=new SearchDoc(getDbAccess(), \Dcp\Family\Iuser::familyName);
    $results=$s->search();
    print_r($results);

Le retour par défaut est sous la forme de tableau indexé par les noms des
[propriétés][propdoc] et des [attributs][docattributs] du document.

Exemple de retour :

    [php]
    Array
    (
        [0] => Array
            (
                [id] => 1009
                [owner] => 1
                [title] => anonymous guest
                ....les attributs de la famille IUSER
                [us_lname] => anonymous
                [us_fname] => guest
                [us_mail] => 
                [us_extmail] => 
                [us_meid] => 1009
                [us_login] => anonymous
                ...
                )
        [1] => Array
            (
                [id] => 5835
                [owner] => 1
                [title] => Dogue Robert
                ...

L'utilisation de ce type de retour peut être utilisé avec les
[templates][layoutblock]. Dans le cadre d'une recherche de document pour
réaliser un retour sur une interface, la classe
[`formatCollection`][formatcollection] permet de récupérer de manière optimisée
les données affichables des documents recherchés.

## Récupération du résultat de la recherche {#core-ref:d0a89548-a743-4dfc-bf43-49192ef1b6a8}

Par défaut les résultats suivants sont exclus :

*   Les documents supprimés (`doctype = 'Z'`)
*   Les documents figés (`locked = -1`)
*   Les documents temporaires (`doctype='T'`)
*   Les documents archivés (`archiveid is null`)
*   Les documents non visibles par l'utilisateur courant ([droit][docacl] `view`)


### Retour de documents bruts 

Si la méthode ::setObjectReturn() n'est pas utilisée ou utilisée avec l'argument
`false` la méthode `SearchDoc::search()` retourne un tableau à 2 dimensions. Le
tableau de deuxième niveau contient les valeurs brutes des propriétés et des
attributs du document indexé par leur nom.

Avec une boucle `foreach`.

    [php]
    $s=new SearchDoc("","IUSER");
    $rawDocuments=$s->search();
    foreach ($rawDocuments as $k=>$rawDoc) {
      print "$k)".$rawDoc["title"]."(".getv($rawDoc,"us_mail","nomail").")\n";
     }

Avec une boucle `while` en utilisant la méthode `SearchDoc::nextDoc()` : 

    [php]
    $s=new SearchDoc("","IUSER");
    $s->search();
    $k=0;
    while ($rawDoc=$s->nextDoc()) { 
      print "$k)".$rawDoc["title"]."(".getv($rawDoc,"us_mail","nomail").")\n";
      $k++;  
    }

**Note** : La fonction `getv` retourne la valeur d'un élément du document brut.
Cette fonction permet aussi d'extraire des valeurs pour des attributs
spécifiques aux sous-familles si la recherche comporte de tels documents.

### Retour d'objets documentaires

Ce programme permet d'écrire tous les titres des documents accisible de la
famille "utilisateur". Ici, on n'a utilisé que le critère d'appartenance à
une famille.  L'appel à la méthode DocSearch::setObjectReturn() indique que le
retour de méthode DocSearch::Search() est un tableau d'objets documentaires.

Dans ce cas, il est possible d'appliquer les méthodes des objets sur les retours
(exemple Doc::getRawValue).  

    [php]
    $s=new SearchDoc('',"IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); 
    $s->search(); // déclenchement de la recherche
    
    $c=$s->count();
    print "count $c\n";
    $k=0;
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->getTitle()."(".$doc->getRawValue("US_MAIL","nomail").")\n";
      $k++; 
    }

**Note** : Le document retourné dans la variable `$doc` ne doit pas être utilisé
en dehors de la boucle. Cette variable est réutilisée à chaque itération.

### Utilisation des itérateurs

Pour récupérer la liste des documents, il est aussi possible d'utiliser un
[itérateur PHP][phpiterator] afin de parcourir la liste des documents.

    [php]
    $s=new SearchDoc("","IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); // retour d'objets documentaires
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();
    
    foreach ($dl as $docid=>$doc) {
      print "$docid)".$doc->getTitle()."(".$doc->getRawValue("us_mail","nomail").")\n";
    }
 
La méthode ::getDocumentList() retourne un objet `DocumentList` qui est un
itérateur. Il est possible avec cet objet de l'utiliser dans une boucle
classique "foreach". 

**Attention** : ne pas utiliser directement la méthode getDocumentList dans le
foreach car cela retournerait un nouvel itérateur à chaque boucle.

**Note** : Le document retourné dans la variable `$doc` ne doit pas être utilisé
en dehors de la boucle. Cette variable est réutilisée à chaque itération.

## Recherche avec critères sur des attributs de document {#core-ref:0f8f5e66-5ed7-47b8-bcfd-038e0eec9d26}

Dans le cas où une famille d'appartenance est précisée, il est possible
d'utiliser les attributs de cette famille comme critères.

    [php]
    $searchedName='jean';
    $s=new SearchDoc("","MY_CONTACT"); // recherche sur les document de la famille "MY_CONTACT"
    $s->addFilter("my_firstname ~* 'jean'"); // prénom contient jean 
    $s->setObjectReturn(true);
    $s->search();
     
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->getTitle()."(".$doc>getRawValue("my_mail","nomail").")\n";
     }

L'exemple ci-dessus montre la recherche de toutes les personnes dont l'adresse
courriel est un organisme et dont le prénom contient jean. Le paramètre sqlfilters
établit une conjonction de condition.  Recherche avec l'opérateur 'or' Si on
veut établir une disjonction, il faut l'écrire manuellement en SQL en utilisant
l'opérateur logique `or`.

Les [opérateurs sql][pgop] utilisés doivent être compatibles avec les types des
[attributs][docattributs] stockés en base de données.

    [php]
    $s=new SearchDoc("","MY_CONTACT");// famid : toute famille
    $s->addFilter("my_firstname ~* 'jean|patrick'"); // prénom contient jean ou patrick
    // mail fini par .org ou cp commence par 31//
    $s->addFilter("(my_mail ~ '\.org$') or (my_postalcode ~ '^31')");   
    $s->setObjectReturn(true);
    $s->search();
     
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->title."(".$doc->getRawValue("my_mail","nomail").':'.
        $doc->getRawValue("my_postalcode").")\n";
     }

**Note** : Les types [`docid`][attdocid] sont enregistrés au format `text` dans la
    base de données.


### Recherche sur des attributs de type énumérés (getKindDoc) {#core-ref:f5a2cf74-ee40-4df8-93fa-f75b0b9f5aaf}

Pour rechercher des documents suivant des attributs de type énumérés, une
fonction simplifiée de recherche existe. Cette fonction getKindDoc() a pour but
de construire la règle de filtrage adéquate pour tenir compte de la hiérarchie
dans ce type d'attribut.

    [php]
    include_once("FDL/Class.Doc.php");
    include_once("FDL/Lib.Dir.php");
    
    $dbaccess=GetParam("FREEDOM_DB");
    $tdoc=getKindDoc($dbaccess,
     "USER",         // nom de la famille//
     "us_type",      // attribut énuméré où s'applique le filtrage//
     "chefserv");    // clef à rechercher//
     
    while (list($k, $v) = each($tdoc)) {
      print "$k)".$v["title"]."(".getv($v,"us_mail","nomail").")\n";
     }


Cet exemple permet de sélectionner la liste des chefs de service. Le chef de
service a pour clef 'chefserv'.

### Recherche dans un array {#core-ref:5342d63e-edc8-44fb-bed9-2fb113742849}

Pour une famille avec un tableau contenant une liste de valeur, le
filtre Postgresql suivant permet de filtrer les documents dont une des valeurs
est égale à une valeur précise :

    [php]
    $s->addFilter("string_to_array(%s,E'\\n') && '{%s}', $attrId, $expectedValue);

Si le tableau contient une liste d'identifiants de document, le filtre
Postgresql suivant peut être utilisé pour retourner tous les documents contenant
cet identifiant :

    [php]
    $s->addFilter("%s ~ E'\\\\y%d\\\\y'", $attrId, $expectedInitid);

Ce filtre ne peut être utilisé qu'avec des valeurs qui n'ont pas d'espace.
Le filtre précédent fonctionne aussi mais il est un peu moins performant.

### Recherche avec jointure {#core-ref:82d4a6a8-39da-4ad1-a697-8da77c9aff07}

Il est possible d'ajouter des critères portant sur une autre table en utilisant
un mécanisme de jointure. Ce mécanisme ne permet pas de récupérer des données
provenant de cette autre table mais permet de les utiliser comme critère de
recherche. Exemple : recherche des documents qui ont dans l'historique un ordre
de suppression émis par l'utilisateur courant

    [php]
    $s=new searchDoc();
    $s->trash='only'; // recherche dans les documents supprimés (mis dans la corbeille)
    $s->join("id = dochisto(id)");
    $s->addFilter("dochisto.uid = %d",$this->getSystemUserId());
    $s->addFilter("dochisto.code = 'DELETE'");
    $s->distinct=true;
    $result= $s->search();

Il est possible d'utiliser les tables `dochisto`, `docutag` ou `docrel` pour
établir un critère de jointure. On ne peut utiliser qu'un seul ordre "join" par
requête.

Il est aussi possible de créer un critère sur une famille liée :

    [php]
    $s=new SearchDoc($dbaccess,"ZOO_ANIMAL");
    // la famille ZOO_ANIMAL est liée à la famille ZOO_ESPECE via l'attribut AN_ESPECE
    $s->join("an_espece::int = zoo_espece(initid)");
    $s->addFilter("zoo_espece.es_ordre='Rongeur'");
    $s->setObjectReturn(true);
    $s->search();
    while ($doc=$s->nextDoc()) {
       print $doc->getTitle()."\n";
    }

Dans l'exemple décrit on recherche les animaux dont l'ordre déclaré dans
l'espèce est 'Rongeur'. Attention à bien lier les deux famille à travers
l'identificateur initial (`initid`) dans le cas des relations créées avec les
options par défaut.

## Recherche de famille {#core-ref:1a33f90f-3d48-4eb8-8415-e49a1ad34e7e}

Pour rechercher des familles, il faut utiliser la valeur "-1" lors de la
construction de l'objet _recherche_.

    [php]
    $sd=new SearchDoc("", -1); 
    // toutes les familles 
    $sd->search();


## Recherche de document depuis leur identifiant {#core-ref:de554832-30f5-485a-8303-31cf464d613d}

Si vous disposez d'une liste d'identifiant de document, il n'est pas conseillé
de réaliser une boucle avec l'appel au constructeur new_doc car cela se révèle
lent et consommateur en mémoire. Il est conseillé dans ce cas d'utiliser
l'itérateur de document.

    [php]
    $dl=new DocumentList();
    $dl->addDocumentIdentifiers(array(1112, 1110, 1120, 2034));
    foreach ($dl as $fam) {
      print $fam->getTitle()."\n";
    }

La méthode `DocumentList::addDocumentIdentifiers()` permet de renseigner la
liste des identifiants de document. Si dans la liste un ou plusieurs identifiant
n'existe pas alors l'itérateur ne les retournera pas. Dans ce cas le nombre de
document retourné sera inférieur au nombre de d'identifiant donné. Par défaut
seuls les document que l'utilisateur a le droit de voir sont retournés. Si vous
voulez affiner les critères de recherche vous pouvez le faire en utilisant la
recherche stockée dans l'iterateur.

    [php]
    $dl=new DocumentList();
    $dl->addDocumentIdentifiers(array(1180, 3852, 3853));
    $dl->getSearchDocument()->addFilter("title ~ 'Doe'");
    $dl->getSearchDocument()->noViewControl();

Cela ne retournera que les documents dont le titre contient Doe parmi les trois
documents donnés sans tenir compte des droits de visibilités. Il est possible
aussi d'utiliser la fonction de callback pour l'appliquer à l'ensemble de la
liste (voir `DocumentList::listMap()`).

## Recherche de document contenu dans un dossier {#core-ref:7f084be4-ceb8-464d-81e4-8902da361aff}

La classe SearchDoc permet de faire des recherches dans un dossier ou une
recherche spécifique au moyen de la méthode `DocSearch::useCollection()`. Cette
recherche n'est pas récursive par défaut, c'est à dire qu'elle ne recherchera
que dans le dossier indiqué. il est possible de faire des recherches récursives
à l'aide de la méthode DocSearch::setRecursiveSearch(). Le niveau de profondeur
de la recherche est ensuite défini au moyen de la propriété
DocSearch::folderRecursiveLevel, positionné à 2 par défaut.

**Note** : On notera que c'est le niveau de récursivité. par exemple,
`folderRecursiveLevel=0` veut dire que l'on recherche dans le dossier, alors que
`folderRecursiveLevel=1` indique de rechercher dans le dossier et ses sous-
dossiers.


    [php]
    $dirid=2345; // identifiant d'un document recherche
    $s=new SearchDoc();
    $s->setObjectReturn();
    $s->useCollection($dirid);
    $s->search();
    if ($s->searchError()) {
         $action->exitError(sprintf("search error : %s",$s->getError()));
    }


## Recherche en fonction des droits {#core-ref:8fd719e9-cc92-4ca4-822c-911a9fee10bf}

### Recherche sans droit

Par défaut, seuls les documents que l'utilisateur a le droit de voir sont
retournés. Pour retourner tous les documents sans vérifier les droit, il faut
utiliser la méthode `overrideViewControl()`.

    [php]
    $s=new SearchDoc(getDbAccess(), $familyId);
    $s->overrideViewControl(); // pas de control de droit voir

**Note** : Si la recherche est faite sous l'identité `admin`, aucun droit n'est
vérifié.

### Recherche et documents confidentiels {#core-ref:5da495b6-7e9f-4063-a254-3689bb786389}

Les documents confidentiels sont les documents dont la propriété 'confidential'
est égale à 1. L'accès à ces documents doit être contrôlé par l'application qui
décide quelles parties elle veut montrer. À la différence du droit voir ('view')
des documents, la recherche retourne les documents confidentiels par défaut. Le
filtrage est à faire du côté de l'application avec un post-traitement.
Cependant, il est possible de rajouter un filtre permettant de ne pas retourner
les documents confidentiels que l'utilisateur n'a pas le droit de voir (droit :
'confidential'). Pour cela, il faut appeler la méthode "excludeConfidential()".

    [php]
    $sd=new SearchDoc($dbaccess, $familyId); 
    $sd->excludeConfidential(); 
    $sd->search();
    
## Recherche des relations d'un document {#core-ref:fb23820a-e8e9-47a0-a22f-d25458e51ed0}

Pour trouver les documents qui sont lié à un autre, il faut utiliser la classe `DocRel`.
La méthode `DocRel::getIRelations()` donne la liste des documents liés vers un document.

    [php]
    include_once("FDL/Class.Doc.php");
    $docrelation=new DocRel();
    $doc=new_doc("", 5835 , true);
    
    $docrelation=new DocRel($doc->initid);
    
    $toMeRelation=$docrelation->getIRelations();
    $fromMeRelation=$docrelation->getRelations();
    
    print "\n# --------- Relation vers moi\n";
    print_r($toMeRelation);
    print "\n# --------- Relation depuis moi\n";
    print_r($fromMeRelation);

La méthode `DocRel::getIRelations()` retourne les caractéristiques des documents liés.

*   sinitid : identifiant initial source (celui qui pointe vers la cible)
*   cinitid : identifiant initial cible (la cible pointé par la source)
*   stitle : titre de la source
*   ctitle : titre de la cible
*   sicon : icone de la source
*   cicon : icone de la cible
*   type : type de lien (nom de l'attribut ayant étable le lien)
*   doctype : doctype du document source

Résultat :

 <table>
    <tr><td style="vertical-align:top;width:50%"><pre>
    # --------- Relation vers moi
    Array
    (
        [0] => Array
            (
                [sinitid] => 5973
                [cinitid] => 5835
                [ctitle] => Dogue Robert
                [cicon] => ugarde.png
                [stitle] => Théodor
                [sicon] => animal.png
                [type] => an_gardien
                [doctype] => F
            )
        [1] => Array
            (
                [sinitid] => 5835
                [cinitid] => 5835
                [ctitle] => Dogue Robert
                [cicon] => ugarde.png
                [stitle] => Dogue Robert
                [sicon] => ugarde.png
                [type] => us_meid
                [doctype] => F
            )
    )
 </pre></td><td ><pre>
    # --------- Relation depuis moi
    Array
    (
        [0] => Array
            (
                [sinitid] => 5835
                [cinitid] => 5830
                [ctitle] => Surveillants
                [cicon] => igroup.png
                [stitle] => Dogue Robert
                [sicon] => ugarde.png
                [type] => us_idgroup
                [doctype] => F
            )
        [1] => Array
            (
                [sinitid] => 5835
                [cinitid] => 1010
                [ctitle] => Utilisateurs
                [cicon] => igroup.png
                [stitle] => Dogue Robert
                [sicon] => ugarde.png
                [type] => us_idgroup
                [doctype] => F
            )
        [2] => Array
            (
                [sinitid] => 5835
                [cinitid] => 5832
                [ctitle] => Gardien surveillant
                [cicon] => role.png
                [stitle] => Dogue Robert
                [sicon] => ugarde.png
                [type] => us_roles
                [doctype] => F
            )
 </pre></td></tr></table>

Pour exploiter les résultats, il est possible d'utiliser un object `DocumentList`.

    [php]
    $ids=array_map(function ($r) {
                return $r["sinitid"];
                 }, $toMeRelation);
    $dl=new DocumentList();
    $dl->addDocumentIdentifiers($ids);
    /**
     * @var Doc $doc
     */
    foreach ($dl as $doc) {
        printf("%s %s '%d'\n", $doc->getFamilyDocument()->getTitle(), $doc->getTitle(), $doc->id);
    }

Résultat :

    Gardien Dogue Robert '5835'
    animal Théodor '5973'

L'object  `$dl` contient alors les documents pointant vers la cible.


## Recherche et révision {#core-ref:cbb4116f-f49b-413b-b9a9-1dc17668fc57}

Par défaut seule la dernière révision du document est retournée. Pour chercher
sur l'ensemble des révisions, il faut mettre la propriété `latest` a `false`.

    [php]
    $s=new SearchDoc(getDbAccess(), $familyId);
    $s->setObjectReturn(true);
    $s->latest=false; // toutes les révisions

Si la propriété `locked = -1`, cela indique que le document est figé.

## Recherche sur les propriétés {#core-ref:c6cc1dd2-0c6e-4665-9221-d50f569813ce}

Cet exemple montre la recherche de document par le titre. Ici, tout type de
document est retourné si son titre contient 'jean' en majuscule ou minuscule.
Les opérateurs utilisables sont les [opérateurs SQL][pgop] de PostgreSQL.


    [php]
    $nom="jean";
    $s=new SearchDoc();// famid : toute famille
    $s->addFilter("title ~* '%s'",$nom); // titre contient jean 
    $s->setObjectReturn();
    $dl=$s->search()->getDocumentList();
     
    foreach ($dl as $k=>$doc)
      print "$k)".$doc->getTitle()."\n";
    }

Dans la cas où on recherche une valeurs dans n'importe quel attribut du
document, on utilisera la [propriété][propdoc] `svalues`. Cet attribut contient
la concaténation des valeurs des autres attributs séparés par le caractère `£`.

    [php]
    $searchExpression='myWord';
    $s=new SearchDoc();// famid : toute famille
    $s->addFilter("svalues ~* '%s'", $searchExpression); 


### Recherche sur les états d'un document lié à un cycle de vie {#core-ref:1b9c384a-bd2d-445b-9232-f07d59788482}

## Callback et itérateur

### callback sur un itérateur

Il est possible d'appliquer une fonction sur chacun des documents d'une liste de
documents provenant d'un iterateur.

    [php]
    $s=new SearchDoc("","IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); // retour d'objets documentaires
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();
    $test=1;
    $callback=function (&$doc) use ($test) {
              if ($test) { // test for fun
                $doc->lock();  // here lock document
              }
    };
    $dl->listMap($callback);
    foreach ($dl as $docid=>$doc) {
      print "$docid)".$doc->getTitle()."(".$doc->getProperty("locked").")\n";
    }


Dans cet exemple l'ensemble des documents sera verrouillé. La fonction de
mapping est appelée sur chacun des documents lors de l'itération.. S'il n'y a
pas d'itération la fonction de mapping ne sera pas appelée.

### callback sur un itérateur avec filtrage

La fonction de callback permet aussi d'exclure des documents de l'itérateur. Si
la méthode retourne le booléen `false` alors le document sera exclu de la liste.
Tout autre retour que le booléen `false`, retournera le document, même s'il n'y
a pas de retour explicite.

    [php]
    $s=new SearchDoc("","MY_DOCS");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();

    $callback=function (&$doc)  { 
                if (! $doc->isLocked()) {
                      $doc->lock();
                      return true;
                }
                return false;
    };
    $dl->listMap($callback);
    foreach ($dl as $docid=>$doc) {
      print "$docid)".$doc->getTitle()."(".$doc->getProperty("locked").")\n";
     }


Cet exemple ne verrouillera que les document non verrouillés et ne retournera
que les documents venant d'être verrouillés.

## Compter le nombre de résultats

Le nombre de résultat peut être obtenu avec la méthode `DocSearch::count()`
après avoir effectué la recherche (appel `DocSearch::search()`).

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    $s->search();
    $c=$s->count(); // retourne le nombre de résultat

Si seul le nombre vous intéresse, la méthode `::count()` n'est pas la plus
performante car la requête est lancée et l'ensemble des résultats est récupéré.
Pour des performances plus accrues, il faut utiliser la méthode
`SearchDoc::onlyCount()`. Ceci effectue la recherche en ne retournant que le
nombre de documents correspondants.

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    // pas d'appel à Doc::Search
    $c=$s->onlyCount();// retourne le nombre de résultat

Attention, l'appel aux méthodes DocSearch::search ou DocSearch::onlyCount lance
une requête au serveur de base de données. Le résultat est mis en cache pour
être exploité par les itérateurs. Un deuxième appel à DocSearch::search ou
DocSearch::onlyCount ne relance pas une deuxième requête. Si on veut reéxécuter
la requête il faut soit créer un nouvel objet, soit utiliser la méthode
`DocSearch::reset()`.

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    // pas d'appel à Doc::Search
    $c=$s->onlyCount();// retourne le nombre de résultat
    
    $s->reset(); // efface le cache, conserve les critères
    $s->addFilter("cdate > '%s'", date("Y-m-d")); // ajoute un critère
    $s->search(); // relance le recherche

## Traitement des erreurs

Si la requête échoue suite à des erreurs de filtres une exception de type `\Dcp\Db\Exception` est retournée.

Les autres erreurs de configuration sont accessibles en utilisant la méthode
::getError().

    [php]
    try {
        $s=new SearchDoc(getDbAccess(), \Dcp\Family\Iuser::familyName);
        $s->addFilter('us_extmail is not null');
        $s->addFilter("pas bon"); // ici une erreur de filtre
        $results=$s->search();
        if ($s->getError()) {
            // autre erreur de configuration
           printf("search error : %s",$s->getError());
        }
    } catch (\Dcp\Db\Exception $e) {
        print($e->getMessage());
    }

Résultat :

    {DB0005} query prepare error : ERROR:  syntax error at or near "bon"
    LINE 1: ...cked != -1) and (us_extmail is not null) and (pas bon) ORDER...

La classe SearchDoc permet de récupérer les informations sur la requête afin de
débugguer votre recherche. Ces informations sont consultables avec la méthode
DocSearch::getSearchInfo() après avoir exécuté la recherche.:

    [php]
    $s=new SearchDoc("","IUSER");
    $s->addFilter('us_extmail is not null');
    $s->search();
    print_r($s->getSearchInfo())

Résultat :

    Array
    (
        [count] => 4
        [query] => select doc128.id, owner, title, ... us_accexpiredate, values, attrids  from  doc128  where   (doc128.archiveid is null) and (doc128.doctype != 'T') and (doc128.locked != -1) and (us_extmail is not null) ORDER BY title LIMIT ALL OFFSET 0;
        [error] => 
        [delay] => 0.008s
    )


<!-- link -->
[searchdoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[propdoc]:          #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Liste des propriétés du document"
[layoutblock]:      #core-ref:587b563e-7371-469f-9d1e-350607056c73
[formatcollection]: #core-ref:74ce9ce4-8e4e-42ee-a0df-415eb6897a81
[pgop]:             http://www.postgresql.org/docs/9.1/static/functions.html "Opérateurs Postgresql 9.1"
[docattributs]:     #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3
[attdocid]:         #core-ref:d461d5f5-b635-47a0-944d-473c227587ab
[phpiterator]:      http://php.net/manual/fr/class.iterator.php "Interface Iterator"
[docacl]:           #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d "Droits du document"