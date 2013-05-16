# Description des rôles

Les rôles représentent les fonctions des utilisateurs dans l'organisation. Ils sont utilisés dans la définition des [droits](#core-ref:ce576351-dbe6-45d1-8097-f9573502b651). 

## Caractéristiques des rôles
Les principaux attributs de la famille _Rôle_ sont :

Nom `role_name`
: Dénomination du rôle. Souvent c'est sa fonction. Exemple : conducteur, mécanicien, physicien.

Référence `role_login` 
: référence système. Il sert à l'identification du rôle. Il doit être unique sur l'ensemble des comptes (utilisateurs, rôles et groupes). La référence doit être en minuscule. Cette référence est transformée en minuscule lors de l'enregistrement. Depuis l'interface du _centre d'administration_, cette référence ne peut pas être renseignée, elle est calculée automatiquement avec un identifiant unique (exemple "role51949e892a469").

Identifiant système `us_whatid`
: Identifiant numérique système unique. Cet identifiant est donné par le système lors de l'enregistrement. Il sert d'identifiant pour l'objet système associé au document. Voir  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>.

## Création d'un rôle

La création _manuelle_ d'un rôle est possible depuis le _centre d'administration_ avec l'application _Gestion des utilisateurs_.

Par programmation il suffit de créer un document de la famille rôle `ROLE`.

    [php]
    $dr=createDoc("","ROLE");
    if ($dr) {
         $dr->setValue("role_login","designer");
         $dr->setValue("role_name","Concepteurs");
         $err=$dr->store();
         if (!$err) {
             print "nouveau rôle n°".$dr->getValue("us_whatid"); // affichage de l'identifiant numérique système          
         } else {
             print "\nerreur:$err";
         }
     }
  

La méthode _ROLE::getAccount() permet de récupérer l'objet système "Account". Voir le paragraphe  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>

## Ajout d'un rôle à un utilisateur
L'ajout direct d'un groupe à un utilisateur se fait depuis le document _Utilisateur_. C'est l'attribut `us_roles` qu'il faut modifier pour changer les associations de rôles aux groupes.

    [php]
    $dr=new_doc("",2435); // Rôle à ajouter
    $du=new_doc("",1073); // Utilisateur
    if ($du->isAlive()) {
      $uRoles=$du->getMultipleRawValues("us_roles");
      printf("Ajout rôle %s pour %s\n",$dr->getTitle(),$du->getTitle());
      $uRoles[]=$dr->initid;
      $uRoles=array_unique($uRoles); // éviter les doublons si déjà présent
      $err=$du->setValue("us_roles",$uRoles);
      if (!$err) {
        $err=$du->store();
      }
      if ($err) {
        print "Erreur: $err\n";
      } else {
        print "Nouvelle liste de rôles:\n";
        print_r($du->getAttributeValue("us_t_roles"));
      }
    }
    
## Association d'un rôle à un groupe
L'association va propager le rôles à l'ensemble des membres du groupes et des sous-groupes. C'est l'attribut `grp_roles` qu'il faut modifier pour changer les associations de rôles aux groupes.

    [php]
    $dr=new_doc("",2435); // Rôle à ajouter
    $dg=new_doc("",2434); // Groupe
    if ($dg->isAlive()) {
      $gRoles=$dg->getMultipleRawValues("grp_roles");
      printf("Ajout rôle %s pour %s\n",$dr->getTitle(),$dg->getTitle());
      $gRoles[]=$dr->initid;
      $gRoles=array_unique($gRoles); // éviter les doublons si déjà présent
      $err=$dg->setValue("grp_roles",$gRoles);
      if (!$err) {
        $err=$dg->store();
      }
      if ($err) {
        print "Erreur: $err\n";
      } else {
        print "Nouvelle liste de rôles:\n";
        print_r($dg->getAttributeValue("grp_roles"));
      }
    }

