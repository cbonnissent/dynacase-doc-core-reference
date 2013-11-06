# Manipulation des comptes utilisateur {#core-ref:68c93fb2-088c-435a-b4ac-e1b94095d0c9}


Ce chapitre a pour but de montrer par l'utilisation des méthodes et fonctions
les plus courantes pour manipuler les utilisateurs "classique".

Ce chapitre ne décrit pas la manipulation des utilisateurs réseaux disponibles
avec le module "networkuser".

## Création d'un utilisateur

La création d'un utilisateur peut être fait à l'aide de la [famille
`IUSER`][users].

Les comptes utilisateurs sont gérés par la classe Account. La famille `IUSER`
permet de faire le lien entre le compte "système" (classe Account) et le
document (famille `IUSER`).

Un utilisateur est identifié par un numéro unique. Ce numéro est renseigné par
l'[attribut `us_whatid`][dbuser] du document `IUSER`. Il correspond à l'attribut
"id" de la classe `Account`.

Code minimaliste pour créer un utilisateur via les documents.

    [php]
    include_once("FDL/Class.Doc.php");
    $du=createDoc("",`IUSER`);
    if ($du) {
        $du->setValue("us_login","jean.martin");
        $du->setValue("us_lname","martin");
        $du->setValue("us_fname","jean");
        $du->setValue("us_passwd1","secret");
        $du->setValue("us_passwd2","secret"); // nécessaire de doubler à cause des contraintes
        $err=$du->store();
        if (!$err) {
          print "nouvel utilisateur n°".$du->getValue("us_whatid"); // affichage de l'identifiant système          
        } else {
          print "\nerreur:$err";
        }
    }


## Correspondance entre compte User et document IUSER

Pour récupérer le compte système à partir du document `IUSER` :

    [php]
    $user=$userDoc->getAccount();
    if ($user->id != $doc->getValue("us_whatid") ) {
        // ce n'est pas normal
    }

Si vous ne disposez que de l'identifiant documentaire vous pouvez aussi utiliser
la méthode setFid de la classe Account:

    [php]
    $u=new Account();
    $u->setFid($docUserId);
    if ($u->isAffected()) {
       print $u->login;
    }

A l'inverse pour récupérer l'objet documentaire à partir du compte système, vous
pouvez utiliser l'attribut "fid".

    [php]
    $u=new Account();
    $u->setLoginName("john.doe");
    if ($u->isAffected()) {
      $doc=new_doc("", $u->fid);
    }

Attributs de correspondance : Compte User &hArr; Document IUSER

| Compte User | Document `IUSER` |
| ----------- | ---------------- |
| id          | us_whatid        |
| login       | us_login         |
| mail        | us_mail          |
| firstname   | us_fname         |
| lastname    | us_lname         |
| fid         | id               |


Exemple de création d'utilisateur via la classe `Account`

    [php]
    $u=new Account();
    $u->login='jean.dupond';
    $u->firstname='Jean';
    $u->lastname='Dupond';
    $u->password_new='secret';
    $err=$u->add();
    if ($err) {
      error_log($err);
    } else {
      print "Nouvel utilisateur n°".$u->id;
    }

## Groupe d'utilisateurs 

La famille `IGROUP` permet de rajouter des utilisateurs dans des groupes.

La famille `IGROUP` comme la famille `IUSER` utilise la classe User pour
identifier les groupes "système".

Comme la famille IUSER, la famille `IGROUP` dispose de la méthode
`IGROUP::getAccount()` pour récupérer l'objet `Account` correspondant

### Correspondance Compte User &hArr; Document IGROUP


| Compte Group | Document `IGROUP` |
| ------------ | ----------------- |
| id           | us_whatid         |
| login        | us_login          |
| lastname     | grp_name          |
| fid          | id                |


Le compte "Account" d'un groupe a toujours son attribut "accounttype" à "G".

### Ajout d'un utilisateur à un groupe

Utilisation de `_IGROUP::AddFile()`.

Ajout de l'utilisateur n°1009 dans le groupe GDEFAULT :

    [php]
    include_once("FDL/Class.Doc.php");
     
    $dbaccess=getDbAccess();
     
    $g=new_Doc($dbaccess,"GDEFAULT");
    $u=new_Doc($dbaccess,1009); // 1009 est la référence documentaire de l'utilisateur
     
    printf("ajout de l'utilisateur %s [%d] au groupe %s [%d]\n",
           $u->getTitle(),$u->id,$g->getTitle(),$g->id);
     
    printf("liste des groupes avant\n");
    print_r($u->getTValue("us_idgroup"));
     
    $err=$g->addFile($u->initid);
    print "Error:$err\n";
     
    printf("liste des groupes apres\n");
    print_r($u->getTValue("us_idgroup"));

### Suppression d'utilisateur dans un groupe

Utilisation de `_IGROUP::DelFile()`.

    [php]
    include_once("FDL/Class.Doc.php");
     
    $dbaccess=getDbAccess();
     
    $g=new_Doc($dbaccess,"GDEFAULT");
    $u=new_Doc($dbaccess,1009);
     
    printf("suppression de l'utilisateur %s [%d] du groupe %s [%d]\n",
           $u->getTitle(),$u->id,$g->getTitle(),$g->id);
    
    printf("liste des groupes avant\n");
    print_r($u->getTValue("us_idgroup"));
     
    $err=$g->delFile($u->initid);
    print "Error:$err\n";
     
    printf("liste des groupes apres\n");
    print_r($u->getTValue("us_idgroup"));

### Récupération des membres d'un groupe

À partir de l'objet "Account" d'un groupe : `Account::getAllMembers()`.

Exemple d'utilisation :

    [php]
    $docGroup=new_Doc("", "GDEFAULT");
    $group=$docGroup->getAccount();
    $members=$group->getAllMembers();
    $userDocIdList=array();
    foreach ($members as $user) {
        printf("%s) %s\n", $user["id"],$user["login"]);
        $userDocIdList[]=$user["fid"];
    }
    print "---\n";
    // recherche des documents `IUSER` correspondants
    $dl=new DocumentList();
    $dl->addDocumentIdentificators($userDocIdList);
    foreach ($dl as $docid=>$docIUser) {
        printf("%s)%s\n", $docIUser->id,  $docIUser->getTitle());
    }

## Récupération des utilisateurs associés à un rôle

Comme pour les groupes, à partir de l'objet "Account" d'un rôle :
`Account::getAllMember()`.

Exemple d'utilisation :

    [php]
    $docRole=new_Doc("", "TST_ROLE");
    $members=$docRole->getAccount()->getAllMembers();
    $userDocIdList=array();
    foreach ($members as $user) {
      printf("%s) %s\n", $user["id"],$user["login"]);
      $userDocIdList[]=$user["fid"];
    }
    print "---\n";
    // recherche des documents `IUSER` correspondants
    $dl=new DocumentList();
    $dl->addDocumentIdentificators($userDocIdList);
    foreach ($dl as $docid=>$docIUser) {
      printf("%s)%s\n", $docIUser->id,  $docIUser->getTitle());
    }

## Récupération des rôles d'un utilisateur

À partir de l'objet "Account" , méthode `Account::getAllRoles()`

Exemple d'utilisation :

    [php]
    $u=new Account('');
    $u->setLoginName('john.doe');
    if ($u->isAffected()) {
      $roles=$u->getAllRoles();
      foreach ($roles as $aRole) {
        printf("%d)%s\n", $aRole["id"],$aRole["login"]); 
      }
    }

## Suppléants et titulaires

Affectation d'un suppléant à un utilisateur et récupérations des titulaires.

    [php]
    $u=new Account(); 
    $u->setLoginName("j1"); 
    if ($u->isAffected()) { 
      $err=$u->setSubstitute("j2"); // J1 est le titulaire de J2 
                                    //(J2 est suppléant de J1) 
    } 
    $u->setLoginName("j3"); 
    if ($u->isAffected()) { 
      $err=$u->setSubstitute("j2");// J3 est le titulaire de J2 
    } 
    $u->setLoginName("j2"); 
    $incumbents=$u->getIncumbents(); // J2 a comme titulaire J1 et J3 
    foreach ($incumbents as $k=> $aIncumbent) { 
      printf("%d)%s\n", $k,Account::getDisplayName($aIncumbent)); 
    }

    www-data@luke:~$ ./wsh.php --api=testSubstitute
    0)j1 Doe 
    1)j3 Doe 

## Recherche de comptes

Il est possible de rechercher les comptes suivant leurs critères d'appartenance
à des rôles ou des groupes. La classe `SearchAccount` permet de réaliser
facilement la recherche de compte. Le résultat de cette recherche peut retourner
des utilisateurs, des groupes ou des rôles. 

### Recherche des utilisateurs par rôle

Pour indiquer le filtre d'un rôle, il faut utiliser, la méthode ::addRoleFilter(). Cette méthode prend en argument la référence du rôle. La référence correspond à l'attribut 'role_login' du document ou à l'attribut login de l'objet Account. Il ne correspond pas au nom logique du document.

    [php]
    $s = new SearchAccount();
    $s->addRoleFilter('writter');
    $s->setObjectReturn($s::returnAccount);
    /**
     * @var \AccountList $al
     */
    $al = $s->search();
    /**
     * @var \Account $account
     */
    foreach ($al as $account) {
      $login = $account->login;
      print "$login\n";
    }
    
Pour rechercher à partir du nom logique du document rôle, il faut utiliser la
méthode ::docName2login de correspondance fournie par la classe.

    [php]
    $s->addRoleFilter($s->docName2login('TST_ROLEWRITTER'));

La méthode `SearchAccount::setObjectReturn()` permet d'indiquer le type de
résultat obtenu par la méthode `SearchAccount::search()`.  Par défaut cela
retourne un objet AccountList qui est un itérateur sur des objets Account. Il
est possible d'indiquer `SearchAccount::returnDocument`, pour que la méthode
`SearchAccount::search()` retourne un objet `DocumentList` qui donnera les
documents correspondants

    [php]
    $s = new SearchAccount();
    $s->addRoleFilter($s->docName2login('TST_ROLEWRITTER'));
    $s->setObjectReturn($s::returnDocument);
    /**
     * @var \DocumentList $dl
     */
    $dl = $s->search();
    /**
     * @var \Doc $doc
     */
    foreach ($dl as $doc) {
      $login = $doc->getValue("us_login");
      print "$login\n";
    }

Si on précise plusieurs rôles séparés par un espace, cela indiquera une
disjonction (OU).

    [php]
    $s->addRoleFilter("writter controller");

indique que les comptes recherchés ont le rôle "writter" ou "controller". 

Cette écriture est équivalente à 

    [php]
    $s->addRoleFilter("writter");
    $s->addRoleFilter("controller");

La condition d'appartenance à plusieurs rôles n'est pas disponible avec cette
méthode. Ce filtre peut retourner des groupes ou des utilisateurs.

### Recherche des utilisateurs par groupe

La méthode ::addGroupFilter() est équivalent à ::addRoleFilter(). Elle permet de
rechercher parmi les comptes qui appartiennent à différents groupes. Si cette
méthode est combinée à la méthode ::addRoleFilter() cela indiquera tous les
comptes qui appartiennent à un des groupes cités ou à un des rôles cités.

    [php]
    $s->addGroupFilter("all"); // tous les utilisateurs du groupe "all"

La recherche par groupe recherche aussi les comptes dans les sous-groupes. Ce
filtre peut retourner des groupes ou des utilisateurs.

### Recherche sur des critères de compte

La méthode ::addFilter() permet d'ajouter des filtres sur les caractéristiques
des comptes:

*   login
*   firstname
*   lastname
*   mail

&nbsp;

    [php]
    $mailExpr='test';
    $s = new SearchAccount();
    $s->addFilter("mail ~ '%s'", $mailExpr); // filtre les mail qui contiennent test
    $al = $s->search();
    foreach ($al as $account) {
      printf("%s => %s\n ", $account->login, $account->mail);
    }

La méthode `SearchAccount::addFilter()` ajoute une condition supplémentaire sur
le filtre. Le premier argument est la partie statique du filtre et les suivants
sont les arguments du filtre comme pour sprintf.

Au contraire de `SearchAccount::addGroupFilter()` ou
`SearchAccount::addRoleFilter()` les filtres sont autant de critères ajoutés à la
condition finale.

La méthode `SearchAccount::setTypeReturn()` permet de préciser le type de compte
à retourner : Utilisateur, Groupe ou Rôle.

    [php]
    $s->setTypeFilter($s::userType) ; // limité aux utilisateurs
    $s->setTypeFilter($s::userType | $s::groupType ) ;// limité aux utilisateurs et aux groupes
    $s->setTypeFilter($s::roleType) ; // limité aux rôles

Le paramètre est une combinaison des 3 constantes userType, groupType et
roleType.

Par défaut, les comptes retournés ne sont pas liés aux privilèges du document
associé. Si on désire ne rechercher que parmi les comptes que l'utilisateur
courant a le droit de voir il faut rajouter l'appel à la méthode
`SearchAccount::useViewControl()` avant l'appel à `SearchAccount::search()`.

    [php]
    $s->useViewControl(true);

## Dérivation des documents utilisateurs

Les documents système "utilisateur" (famille `IUSER`) peuvent être dérivés pour
ajouter des informations fonctionnelles ou pour ajouter des informations
techniques dans le cas d'un backend d'[authentification spécifique][backend]. 

La famille `IUSER` n'impose pas de contrainte de syntaxe sur le login. La seule
contrainte est que ce "login" doit être unique parmi tous les comptes
(utilisateurs, groupes et rôles). Si vous voulez ajouter une contrainte de
syntaxe sur votre famille "utilisateur" dérivé de `IUSER` vous devez surcharger
la méthode `IUSER::constraintLogin()` qui est une méthode contrainte.

Exemple :

    [php]
     // constraint to limit login to 6 characters
    public function constraintLogin($login)
     {
            //only six alpha num
            $err = '';
            if (!preg_match("/^[a-z0-9]{6}$/i", $login)) {
                $err = _("the login must have six characters");
            }
            // must verify unicity also
            if (!$err) return parent::constraintLogin($login);
            return $err;
     }
 
Attention: lorsque la famille `IUSER` est dérivée, il faut reprendre et adapter
le paramétrage en terme de sécurité (profil, contrôle de vue) en fonction de vos
besoins.

<!-- links -->
[users]:        #core-ref:2bd98eec-5b03-4af0-b9d6-1bbf78fe9733 "Utilisateurs, groupes et rôles"
[dbuser]:       #core-ref:6d5684f4-73e8-431c-8b2b-6224a9e6b074 "Table users"
[backend]:      #core-ref:5a149c1c-c262-4aa6-b7b8-b66135140c49 "Provider d'authentification"