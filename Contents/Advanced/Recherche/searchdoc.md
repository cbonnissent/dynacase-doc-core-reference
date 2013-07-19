# Searchdoc {#core-ref:7291dea8-a2db-46be-8194-bc6f100cc467}


## Recherche de document issus d'une même famille  {#core-ref:5954b300-a514-4a3e-966e-dac5cf07950d}

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
[propriétés][propdoc] et des attributs du document.

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


## Recherche avec critères sur des attributs de document {#core-ref:0f8f5e66-5ed7-47b8-bcfd-038e0eec9d26}

Dans le cas où une famille d'appartenance est précisée, il est possible
d'utiliser les attributs de cette famille comme critères.

    [php]
    $searchedName='jean';
    $s=new SearchDoc("","USER");// famid : toute famille
    $s->addFilter("us_fname ~* 'jean'"); // prénom contient jean 
    $s->setObjectReturn(true);
    $s->search();
     
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->getTitle()."(".$doc>getRawValue("us_mail","nomail").")\n";
     }

L'exemple ci-dessus montre la recherche de toutes les personnes dont l'adresse
email est un organisme et dont le prénom contient jean. Le paramètre sqlfilters
établit une conjonction de condition.  Recherche avec l'opérateur 'or' Si on
veut établir une disjonction, il faut l'écrire manuellement en SQL en utilisant
l'opérateur or.

    [php]
    $s=new SearchDoc("","USER");// famid : toute famille
    $s->addFilter("us_fname ~* 'jean|patrick'"); // prénom contient jean ou patrick
    // mail fini par .org ou cp commence par 31//
    $s->addFilter("(us_mail ~ '\.org$') or (us_workpostalcode ~ '^31')");   
    $s->setStart(0);
    $s->setSlice(10);// les 10 premiers//
    $s->setObjectReturn();
    $s->search();
     
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->title."(".$doc->getRawValue("us_mail","nomail").':'.
        $doc->getRawValue("us_workpostalcode").")\n";
     }


### Recherche sur des attributs de type énumérés (getKindDoc) {#core-ref:f5a2cf74-ee40-4df8-93fa-f75b0b9f5aaf}

Pour rechercher des documents suivant des attributs de type énumérés, une fonction simplifiée de recherche existe. Cette fonction getKindDoc() est basée sur getChildDoc(), elle a juste pour but de construire la règle de filtrage adéquate pour tenir compte de la hiérarchie dans ce type d'attribut.

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

Si vous avez une famille avec un array contenant une liste d'id, vous pouvez
utiliser ce filtre Postgresql pour retourner tous les documents contenant cet id
:

    [php]
    $s->addFilter("an_child ~ '\\\\y%d\\\\y'", $initid);


### Recherche avec jointure {#core-ref:82d4a6a8-39da-4ad1-a697-8da77c9aff07}

Il est possible d'ajouter des critères portant sur une autre table en utilisant
un mécanisme de jointure. Ce mécanisme ne permet pas de récupérer des données
provenant de cette autre table mais permet de les utiliser comme critère de
recherche. Exemple : recherche des documents qui ont dans l'historique un ordre
de suppression émis par l'utilisateur courant

    [php]
    $s=new searchDoc();
    $s->trash='only';
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
l'identificateur initial (initid) dans le cas des relations créées avec les
options par défaut.

## Recherche de famille {#core-ref:1a33f90f-3d48-4eb8-8415-e49a1ad34e7e}

Pour rechercher des familles, il faut utiliser la valeur "-1" lors de la
construction de l'objet _recherche_.

    [php]
    $sd=new SearchDoc("", -1); 
    // toutes les familles 
    $sd->search();

## Recherche de document issus de diverses familles {#core-ref:4e2f3027-4209-4088-a9f3-ef1335c88674}

## Recherche de document depuis leur identifiant {#core-ref:de554832-30f5-485a-8303-31cf464d613d}

## Recherche de document contenu dans un dossier {#core-ref:7f084be4-ceb8-464d-81e4-8902da361aff}


## Recherche en fonction des droits {#core-ref:8fd719e9-cc92-4ca4-822c-911a9fee10bf}

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
    $sd=new SearchDoc($dbaccess, $famid); 
    $sd->excludeConfidential(); 
    $sd->search();
    
## Recherche des relations d'un document {#core-ref:fb23820a-e8e9-47a0-a22f-d25458e51ed0}

## Recherche et révision {#core-ref:cbb4116f-f49b-413b-b9a9-1dc17668fc57}

## Recherche sur les propriétés {#core-ref:c6cc1dd2-0c6e-4665-9221-d50f569813ce}


### Recherche sur les états d'un document lié à un cycle de vie {#core-ref:1b9c384a-bd2d-445b-9232-f07d59788482}

<!-- link -->
[searchdoc]:    #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[propdoc]:      #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Liste des propriétés du document"
[layoutblock]:  #core-ref:587b563e-7371-469f-9d1e-350607056c73
[formatcollection]:  #core-ref:74ce9ce4-8e4e-42ee-a0df-415eb6897a81