# Classe Application

La classe *Application* gère les applications Dynacase.
Cette classe gère l'accès aux fonction globales liées à l'application comme les paramètres applicatifs. Elle permet d'instancier les objets *Action* en vu de leur exécution.

Les propriétés de la classe *Application* sont :

## Propriétés de la classe Action
Ces propriétés sont pour la plupart issu du fichier ".app" de description de l'application.

id
: Identifiant numérique de l'application.
    
    Il est différent suivant les contextes car il est calculé en prenant le prochain numéro disponible lors de l'enregistrement de l'application


name
:
    Référence de l'application. Contient le nom donnée dans le fichier "*.app*" de description de l'application.

short_name
: Description courte de l'application. Issu du fichier "*.app*" de description de l'application.

description
: Description longue de l'application. Issu du fichier "*.app*" de description de l'application.


available
: Indique la disponibilité de l'application.
    
    Elle contient soit 'Y' soit 'N'. 'Y' indique qu'aucune action de l'application ne peut être exécutée. Si cette propriété vaut 'N', les actions ne pourront être exécutées et un message d'erreur sera renvoyé à la place du résultat de l'action.


access_free
: Indique que toutes les actions de l'application ne nécessite pas de droit d'exécution.
    
    Elle contient soit 'Y' soit 'N'. 'Y' indique que les actions n'ont pas d'acl définies.

icon
: Icône de l'application.

childof
: Nom de l'application parente
    
    Cela indique que les actions de l'application parente seront disponibles sur cette application.

with_frame
: Obsolète. Indique que les actions de l'application utilise une entête commune.

objectclass
: Obsolète. Non utilisé

ssl
: Obsolète. Indique que l'application doit être exécutée avec le protocole *https*.

machine
: Obsolète. Indique l'application est déployée sur un autre serveur.

iorder
: Ordre d'installation des applications pour un module déclarant plusieurs applications

tag
: Permet d'indiquer une marque. Les applications de Dynacase Core sont marquées "CORE".


## Propriétés fonctionnelles
Ces propriétés sont renseignées une fois que l'objet *Application* est initialisé avec un identifiant valide.

user
: Objet *Account* identifiant l'utilisateur courant

parent
: Objet *Application* identifiant l'application parente.
    
    Généralement elle pointe vers l'application "CORE".

session
: Objet *Session* identifiant la session de paramètres de l'utilisateur courant.

