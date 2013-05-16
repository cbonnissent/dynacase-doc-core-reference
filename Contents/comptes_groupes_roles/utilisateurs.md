# Description des utilisateurs

## Principales caractéristiques des utilisateurs
Les principaux attributs de la famille _Utilisateur_ sont :

Nom `us_lname` 
: Nom de famille de l'utilisateur

Prénom `us_fname`
: Prénom de l'utilisateur

Mail principal `us_mail`
: Adresse de courriel de l'utilisateur

Login `us_login`
: Identifiant de connexion. Cet identifiant doit être unique pour l'ensemble des comptes; unique pour les utilisateurs mais aussi pour les références de groupe et de rôle. **Note** : Le login doit toujours être en minuscule. S'il comporte des majuscules elle seront transformés en minuscules lors de l'enregistrement. Depuis l'interface de connexion, la vérification du login est insensible à la casse.

Rôles `us_roles`
: Liste des rôles associés à l'utilisateur. Ces rôles peuvent être affectés directement sur l'utilisateur ou obtenu en fonction de ses groupes d'appartenance.

Identifiant système `us_whatid`
: Identifiant numérique système unique. Cet identifiant est donné par le système lors de l'enregistrement. Il sert d'identifiant pour l'objet système associé au document. Voir  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>.

## Mot de passe

Le mot de passe exigé par défaut n'a pas de contrainte. Cependant les paramètres applicatifs suivant permettent d'imposer une force minimum au mot de passe :

`AUTHENT_PWDMINLENGTH`
: Nombre minimum de caractères d'un mot de passe

`AUTHENT_PWDMINDIGITLENGTH`
: Nombre minimum de chiffre d'un mot de passe

`AUTHENT_PWDMINUPPERALPHALENGTH`
: Nombre minimum de lettres majuscule d'un mot de passe

`AUTHENT_PWDMINLOWERALPHALENGTH`
: Nombre minimum de lettres minuscules d'un mot de passe

`AUTHENT_PWDMINSYMBOLLENGTH`
: Nombre minimum de caractères qui ne sont ni des lettres ni des chiffres

Le mot de passe utilisé pour les comptes internes peut comporter aussi les lettres avec accents. On considère un mot de passe fort s'il y a au moins 16 caractères avec au moins un ou deux caractères dans chaque catégories (source ANSSI).

Le mot de passe n'est pas stocké en clair dans la base. Seul son cryptage (SHA256) est stocké afin de vérifier le mot de passe lors de la connexion.

## Validation du compte utilisateur
### Date d'expiration des comptes
Il est possible d'indiquer une date d'expiration du compte sur le document `utilisateur`. Lorsque cette date est atteinte, toute connexion avec se compte est refusée. Un message spécifique indique à l'utilisateur que le compte à expiré et qu'il doit contacter le gestionnaire.

La programmation de cette date est faite en modifiant le compte utilisateur.
Dans l'onglet Système, le cadre Sécurité contient les informations relatives à la sécurité du compte, en particulier la date d'expiration du compte. Vous pouvez préciser une date, modifier ou supprimer la date présente.
Le paramètre applicatif Délai par défaut avant expiration du compte (jours) de l'application AUTHENT permet de fixer la durée par défaut de validité d'un compte. Ce délai exprimé en jour, s'il est valorisé, est utilisé lors de la création de tout compte. La date d'expiration est calculée en ajoutant le nombre de jour paramétré à la date du jour de création.
La présence de cette date d'expiration rend le contrôle systématique. Pour inhiber ce contrôle, la date ne doit pas être renseignée. 
Le contrôle est réalisé quelque soit le mode d'authentification (Dynacase, AD/LDAP, SSO)
Ce contrôle n'est pas réalisé pour le super administrateur Dynacase (admin).

### Limitation des tentatives de connexion
Ce mécanisme permet d'interdire la connexion avec un compte après plusieurs tentatives de connexion avec un mot de passe incorrect.
Dynacase incrémente un compteur à chaque connexion en échec. 
Si le nombre de connexion en échec est spécifié, Dynacase vérifie lors d'une connexion correctement authentifiée que ce nombre n'est pas atteint. Si c'est le cas, la connexion est refusée. Un message spécifique indique à l'utilisateur que le compte est bloqué après un trop grand nombre de tentative de connexions en échec. Sinon, le compteur de connexion est remis à 0.
Le paramètre applicatif _"Nombre d'échecs d'authentification"_ avant la désactivation du compte de l'application "AUTHENT" permet de fixer le nombre maximum de connexion dont l'authentification échoue (mot de passe invalide) avant le blocage du compte. Lors de l'installation de l'application cette valeur est nulle (0). La valeur 0 indique que le contrôle n'est pas réalisée.

Le nombre de tentatives de connexion et le déblocage d'un compte sont disponible en consultant la fiche d'un utilisateur.  À l'onglet _"Système"_, le cadre _"Sécurité"_ présente le nombre de connexion de cet utilisateur pour lesquelles l'authentification a échouée. À partir du menu _"Compte"_, l'item _"Réinitialiser échecs de connexion"_ permet de remettre à 0 ce nombre de connexion et ainsi autoriser à nouveau la connexion d'un utilisateur bloqué.
Le contrôle est réalisé quelque soit le mode d'authentification (Dynacase, AD/LDAP, SSO)
Ce contrôle n'est pas réalisé pour le super administrateur Dynacase (admin).
### Activation / désactivation du compte à la demande
Il est possible d'activer ou de désactiver un compte utilisateur à la demande. Le document utilisateur propose au menu _"Compte"_ un item :
_"Désactiver le compte"_ lorsque le compte est activé (état par défaut lors de la création d'un compte)

Le même menu permet de réactiver un compte qui a été désactivé. L'activation / désactivation de compte n'influe pas sur les droits applicatifs ou documentaires liés aux comptes.
Le contrôle est réalisé quelque soit le mode d'authentification (Dynacase, AD/LDAP, SSO). Un compte utilisateur désactivé ne peut plus être utilisé pour se connecter.
Ce contrôle n'est pas réalisé pour le super administrateur Dynacase (admin).

## Droit d'accès 

Les documents de comptes sont accessibles à tous les utilisateurs. Par contre leur modification est réservée aux administrateurs (utilisateurs appartenant au groupe `administration` - identifiant `GADMIN`). Pour le document `utilisateur`, le détenteur du compte peut modifier ses nom, prénom, mail et mot de passe.

## Création d'un utilisateur

La création _manuelle_ d'un utilisateur est possible depuis le _centre d'administration_ avec l'application _Gestion des utilisateurs_.

Par programmation il suffit de créer un document de la famille utilisateur `IUSER`.

    [php]
    include_once("FDL/Class.Doc.php");
    $du=createDoc("","IUSER");
    if ($du) {
         $du->setValue("us_login","jean.martin");
         $du->setValue("us_lname","martin");
         $du->setValue("us_fname","jean");
         $du->setValue("us_passwd1","secret");
         $du->setValue("us_passwd2","secret"); // nécessaire de doubler à cause des contraintes
         $err=$du->store();
         if (!$err) {
             print "nouvel utilisateur n°".$du->getValue("us_whatid"); // affichage de l'identifiant numérique système          
         } else {
             print "\nerreur:$err";
         }
    }

La méthode _IUSER::getAccount() permet de récupérer l'objet système "Account". Voir le paragraphe  <span class="fixme" data-assignedto="MCO">Ajouter le lien vers le chapitre de la classe Account</span>


## Titulaires et suppléants
Un utilisateur peut désigner un suppléant. Le suppléant reçoit tous les privilèges de celui qui l'a désigné. Ce dernier est nommé le titulaire. Un suppléant peut voir, modifier tous les documents que le titulaire peut voir et modifier. Il peut aussi accéder à toutes les applications auxquelles le titulaire a accès. Par contre, le suppléant ne peut pas modifier le document « utilisateur » de ses titulaires. Ainsi le mot de passe du titulaire ne peut pas être changé par son suppléant. Un titulaire ne peut désigner qu'un seul suppléant. Par contre, un suppléant peut avoir plusieurs titulaires.

Le suppléant est ajouté aux destinataires des courriels qui ont été lancés à partir d'un modèle de mail 7 à destination du titulaire. Le texte « suppléant » est ajouté dans le nom des adresses email des suppléants afin de les différencier des titulaires.

Lors d'une création ou d'une modification d'un document par un suppléant ou lors d'un changement d'états, le texte de l'historique indique que cela est fait par un suppléant dans le cas où celui-ci n'a pas directement (c'est à dire sans qu'il soit suppléant) le droit de le faire.
Les droits sur les suppléants ne sont pas propagés. Si l'utilisateur C est suppléant de B et l'utilisateur B suppléant de A, l'utilisateur C n'a pas les privilèges de A et de B mais seulement les privilèges d'origine de B. B a les privilèges d'origine de A.

La modification d'un suppléant par l'interface est soumis au droit « ESUBSTITUTE » du contrôle de vue « confidentiel utilisateur» qui est associé à la famille « utilisateur ». Par défaut aucun utilisateur n'a la droit de désigner un suppléant.

## Dérivation de la famille utilisateur
La famille utilisateur `IUSER` peut être dérivée comme les autres familles. Cependant, la famille `IUSER` déclarant des hameçons sur le _postStore_, _postCreate_ et _postDelete_, il faut bien faire attention à rappeler le parent en cas de surcharge des hameçons. De même, un contrôle de vues est attaché par défaut aux utilisateurs, il faut aussi reprendre ses vues si la famille dérivée nécessite un autre contrôle de vue.


