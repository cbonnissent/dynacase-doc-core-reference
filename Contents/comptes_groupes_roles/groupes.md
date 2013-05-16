# Description des groupes d'utilisateurs
## Caractéristiques des groupes d'utilisateurs
Les principaux attributs de la famille _Groupe d'utilisateurs_ sont :

Nom `grp_name`
: Dénomination du groupe. Souvent c'est sa fonction. Exemple : commerciaux, recherche & développement.

Identifiant `us_login` 
: Identifiant système. Il sert à l'identification du groupe. Il doit être unique sur l'ensemble des comptes (utilisateurs, rôles et groupe). L'identifiant doit être en minuscule. Cet identifiant est transformé en minuscules lors de l'enregistrement.

Sans adresse mail de groupe `grp_hasmail`
: Ne produit pas l'attribut qui concatène l'ensemble des adresses mail. Cela est intéressant à cocher si le groupe contient beaucoup de membre.
Les autres renseignements sont facultatifs. 

Rôles associés `grp_roles` 
: Tableau indiquant les rôles joués par les utilisateurs membres du groupes. Les rôles sont des éléments déterminants pour la mise en place des [droits](#core-ref:ce576351-dbe6-45d1-8097-f9573502b651) .

Fonction `grp_type`
: Par défaut les groupes constitués sont des groupes fonctionnels. Ils servent à rassembler des utilisateurs ayant des fonctions similaires dans l'entreprise. Cet attribut sert à préciser le lien entre les membres. L'option « service » indique que cela est un groupe qui rassemble les membres d'un même service. Dans ce cas le nom du groupe est généralement le nom du service. L'option « bureau » indique que les membres sont localisés dans le même « bureau ». D'autres options peuvent être ajoutées.

Identifiant système `us_whatid`
: Identifiant numérique système unique. Cet identifiant est donné par le système lors de l'enregistrement. Il sert d'identifiant pour l'objet système associé au document. Voir  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>.

## Création d'un groupe

La création _manuelle_ d'un groupe est possible depuis le _centre d'administration_ avec l'application _Gestion des utilisateurs_.

Par programmation il suffit de créer un document de la famille groupe `IGROUP`.

    [php]
    include_once("FDL/Class.Doc.php");
    $dg=createDoc("","IGROUP");
    if ($dg) {
         $dg->setValue("us_login","driver");
         $dg->setValue("grp_name","Conducteurs");
         $err=$dg->store();
         if (!$err) {
             print "nouveau groupe n°".$dg->getValue("us_whatid"); // affichage de l'identifiant numérique système          
         } else {
             print "\nerreur:$err";
         }
     }
  

La méthode _IGROUP::getAccount() permet de récupérer l'objet système "Account". Voir le paragraphe  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>

## Ajout d'un groupe à un utilisateur

L'ajout direct d'un groupe à un utilisateur se fait depuis le groupe avec la méthode `_IGROUP::insertDocument()`.

    [php]
    $g=new_Doc($dbaccess,"GADMIN");
    $u=new_Doc($dbaccess,1075); // 1075 est la référence documentaire de l'utilisateur
    if ($g->isAlive() && $u->isAlive() ) {
        printf("ajout de l'utilisateur %s [%d] au groupe %s [%d]\n",
    	     $u->getTitle(),$u->id,$g->getTitle(),$g->id);
        printf("Liste des groupes avant\n");
        print_r($u->getAllUserGroups());
      
        $err=$g->insertDocument($u->initid);
        if ($err) {
          print "Error:$err\n";
        } else {
          printf("Liste des groupes après\n");
          print_r($u->getAllUserGroups());
        }
    }

