# Comptes, utilisateurs, groupes et rôles {#core-ref:f6d55bb1-7254-480e-9bfa-61f5e532ccad}

## Résumé {#core-ref:4073bb7b-254e-4461-9c75-ffcf93d1e798}

La gestion des droits et de la sécurité dans Dynacase repose sur la notion de compte. Le compte est lui divisé en trois notions :

Utilisateur
:   Un utilisateur représente une personne (physique ou morale) ayant la capacité de se connecter à la plate-forme, il possède donc à minima un login.

Groupe
:   Un groupe est un ensemble d'utilisateurs et de groupes.  
Les groupes peuvent s'imbriquer et dans ce cas le groupe de plus haut niveau contient l'ensemble des utilisateurs de ses groupes fils (par exemple, le groupe 1 contient le groupe 2 et le groupe 2 contient l'utilisateur 3 alors le groupe 1 contient l'utilisateur 3).

Rôle
:   Un rôle marque une fonction. La notion de rôle est utilisée dans le cadre du profilage, il a deux usages complémentaires :
    
    * au niveau d'un groupe, il indique que l'ensemble des utilisateurs (directement dans le groupe ou hérités de groupes fils) possèdent ce rôle,
    * au niveau d'un profil, il indique que seul les utilisateurs ayant ce rôle peuvent effectuer un certain type d'action (par exemple : uniquement les utilisateurs ayant le rôle *rédacteur* peuvent modifier le document).

## Utilisateur {#core-ref:ecd3b9fb-f038-48ed-9eea-04b9bbeabb51}

Les utilisateurs Dynacase possèdent les principales caractéristiques suivantes :

Nom et prénom
:   Ils permettent d'identifier la personne.

Login
:   le login est l'identifiant unique d'un utilisateur, il est notamment utilisé pour identifier l'utilisateur lors de la phase de login.

Mot de passe (optionnel)
:   Le mot de passe est utilisé lors de la phase de login, il est stocké sous la forme d'une empreinte cryptographique (hash) en base de données.

Adresse e-mail (optionnel)
:   L'adresse e-mail de l'utilisateur est utilisée lors d'un envoi de mail à un utilisateur ou à un groupe d'utilisateurs, cette adresse e-mail est alors automatiquement récupérée par la plate-forme lors de la mise en forme d'un courriel.

Date d'expiration du compte
:   Cette date permet d'indiquer qu'un compte ne sera plus actif passé une certaine date. Lorsque le compte est inactif, l'utilisateur ne peut plus se connecter. Le compte n'est pas supprimé et peut-être réactivé par la suite.

Il est de plus possible de désactiver un compte et de gérer les groupes via les interfaces d'administration et l'API de Dynacase.

## Groupe {#core-ref:e01fc125-52ef-4c48-b4c6-95ddeac23327}

Un groupe est un ensemble d'utilisateurs ou de groupes, il permet d'effectuer les actions suivantes :

* envoi d'un mail aux membres d'un groupe,
* affectation d'un ou plusieurs rôles à l'ensemble des membres du groupe,
* affectation d'ACL à l'ensemble des membres du groupe.

Les groupes possèdent les caractéristiques suivantes :

Nom
:   Nom du groupe

Login
:   Il sert à l'identification du groupe.

Sans adresse mail de groupe
:   Désactive la possibilité d'envoyer un mail aux membres du groupe. 

Rôle
:   la liste des rôles associés à ce groupe

De plus, il est possible d'ajouter/supprimer des utilisateurs/groupes d'un groupe via les interfaces d'administration et l'API de Dynacase.

## Rôle {#core-ref:6017a086-3211-485f-b68a-b93850953065}

Un rôle est uniquement composé de son titre et d'une référence, en effet le rôle n'a de sens que associé à un groupe et à un profil.
