# Sécurité : authentification, droit applicatif, droit documentaire

## Résumé

Ce chapitre aborde la notion de sécurité au sein de Dynacase. Cela comprend les éléments suivants :

Une mécanique d'authentification
:   Ce système permet d'identifier l'utilisateur essayant de se connecter. Il est composé d'un système de frontends et de backends d'authentification. 
    
    Frontend d'authentification 
    :   Système qui décrit la méthode (le protocole) d’interaction avec l'utilisateur pour demander les éléments nécessaires à l'authentification.
    
    Backend d'authentification 
    :   Système qui permet de vérifier auprès d'une autorité la validité des informations d'authentification obtenues par le frontend d'authentification.

Une mécanique d'autorisation
:   Ce système est composé de deux couches et permet de définir ce que l'utilisateur peut ou ne peut pas faire.
    
    La sécurité applicative
    :   Ce système est basé sur des ACL, seuls les utilisateurs possédant l'ACL requise peuvent exécuter l'application ou l'action.
    
    Sécurité documentaire
    :   Un système de droit, profil et rôle permet de désigner de manière statique ou dynamique (suivant l'état et/ou le contenu du document) quels utilisateurs peuvent consulter, modifier, supprimer, etc. des documents.

On peut résumer les mécanismes de sécurité avec le schéma suivant :

![ Sécurité : résumé ](securite_resume.png)

## Mécanisme d'authentification

Le mécanisme d'authentification de Dynacase permet d'identifier les utilisateurs via différentes sources et différents moyens.
    
Les frontend d'authentification fournis par défaut par Dynacase sont :

* authentification par formulaire web,
* authentification par HTTP Basic,
* authentification par jeton.

Les backends d'authentification fournis par défaut par Dynacase sont :

* authentification sur base Dynacase,
* authentification par LDAP (via un module complémentaire).

Il est de plus possible de créer ses propres backend et frontend d'authentification et d'en indiquer l'ordre d'exécution (par exemple, on peut choisir que l'utilisateur sera d'abord authentifié par un reverse proxy puis, si le reverse proxy n'a pas donné l'authentification, par un login sous forme de formulaire).

## Sécurité applicative

La sécurité applicative fonctionne avec un mécanisme d'ACL. Chaque action peut-être associée a une ACL et seul les utilisateurs possédant cette ACL peuvent exécuter cette action.  

NB : une action n'ayant pas d'ACL est accessible à tout utilisateur même si celui-ci n'est pas connecté mais les droits documentaires continuent de s'appliquer (dans le cas d'un utilisateur non connecté c'est l'utilisateur *anonymous guest* qui est utilisé pour le calcul des droits).

## Sécurité documentaire

La sécurité documentaire est le mécanisme permettant de définir qui peut effectuer quelle opération avec un document. 

### Droits par défaut

Les droits par défaut sont les suivants :

Consulter
:   Permet de consulter et trouver le document.

Modifier
:   Permet de modifier le contenu du document que ce soit via le formulaire par défaut ou via l'API appelée en son nom.
    Si ce droit n'est pas présent les modifications ne peuvent être enregistrées.

Supprimer
:   Permet de supprimer le document que ça soit via l'IHM ou via l'API.

De plus, il existe au niveau d'une famille documentaire les droits suivants:

Créer 
:   Un utilisateur ayant ce droit sur un document de famille peut créer un document de cette famille en exécutant une action effectuant cette tâche.

Créer manuellement
:   Un utilisateur ayant ce droit peut créer un document de cette famille, en passant par l'interface de création de document par défaut.

NB : D'autres éléments internes, de plus haut niveau, de Dynacase possèdent plus de droits. Par exemple, les dossiers, recherches et rapport possèdent des droits spécialisés propres à leur fonction (droit d'effectuer la recherche, droit d'ouvrir le dossier, etc.).

### Profil

Le système d'attribution des droits à des utilisateurs repose sur la notion de profil. Un profil est un document interne comportant une matrice permettant d'indiquer quel rôle, groupe ou utilisateur possède quel droit.

![ Sécurité : profil ](liste_droit.png)

On différencie deux usages de profil :

Statique
:   la liste des utilisateurs ayant droit ne varie pas suivant le contenu du document (par exemple : les utilisateurs ayant le profil *Rédacteur* peuvent modifier ce document),

Dynamique
:   la liste des utilisateurs ayant droit varie alors suivant l'étape et/ou le contenu du document (par exemple : seul l'utilisateur cité dans l'attribut *validateur* de document peut le modifier lors de l'étape *validation*)

et différents types de profils :

Document
:   Il concerne un document et n'indique que les droits de base (voir, modifier, supprimer).

Famille
:   Il concerne une définition de famille documentaire et indique les droits de base et les droits de création (via l'IHM par défaut, via le code).

Les autres types de profil
:   Il en existe tout un ensemble qui couvrent les documents systèmes spécialisés de Dynacase (Dossier, Recherche, Rapport, etc.).

Une fois le profil créé, celui-ci doit être associé à un document. Pour ce faire, il existe plusieurs moyens :

Via la famille
:   Le profil est associé via une propriété de la définition de famille. Dans ce cas, tous les nouveaux documents de cette famille porteront ce profil.

Via le cycle de vie
:   Le profil est associé via le paramétrage du cycle de vie à une étape et tous les documents passant par cette étape se voient associés au profil.

Via le code
:   Le profil est associé dynamiquement en utilisant les fonctions de l'API.

Via l'interface de gestion
:   Si l'utilisateur possède les droits suffisants, il lui est possible de changer le profil d'un document en cours.

NB : les moyens sont bien évidemment complémentaires et un document peut changer de nombreuses fois de profil au cours de sa vie.

#### Profil dédié

Le profil dédié est un profil qui n'est valable que pour un document. Il est défini directement au niveau du document et permet de gérer au plus près les accès à ce document.  
Certain types de document système ne peuvent fonctionner qu'avec des profils dédiés, c'est notamment le cas des :

Cycle de vie
:   Le cycle de vie utilisant son profilage pour définir l'accessibilité des transitions, son profil est différent pour chaque cycle de vie.

Contrôle de vue
:   Le document de contrôle de vue utilise son profilage pour définir l'accessibilité des représentations qu'il contient, son profil est donc unique.

