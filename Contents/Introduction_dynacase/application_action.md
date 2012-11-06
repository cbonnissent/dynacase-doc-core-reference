# Applications, actions et ACL

## Résumé

Nous allons détailler les notions de :

Application
:   Une application est un conteneur permettant de regrouper des *Actions*, des *ACL* et des *paramètres*.

Action
:   Une action est une fonction PHP. Cette fonction peut utiliser l'ensemble de l'API de Dynacase et est exécutée au nom de l'utilisateur en cours (les droits, visibilités et autres sont donc respectés). Elles peuvent être utilisées pour effectuer :
    
    * des exports particuliers (textuel ou binaire),
    * des actions particulières (dupliquer des documents, effectuer des modifications de groupes, créations automatiques, etc.),
    * des IHM spécifiques (mise en place d'un portail d'accueil, d'interface de manipulation de documents, etc.)

ACL
:   Une ACL est un droit applicatif, il a deux usages complémentaires. Au niveau d'une action il indique que le compte en cours doit posséder cette ACL pour pouvoir utiliser cette action et associée à un compte (rôle, utilisateur, groupe) il indique que ce compte possède cette ACL.

## Application

Une application est caractérisée par :

Des propriétés
:   Ces propriétés permettent d'identifier et de caractériser l'application. Il y a notamment :
    
    Nom logique
    : le nom logique de l'application,
    
    Nom
    : ce nom est utilisé dans les interfaces d'administration, il peut-être traduit,
    
    Description
    : cette description est utilisée dans les interfaces d'administration, elle peut-être traduite,
    
    Icône
    : cette icône est utilisée dans les interfaces d'administration,

Une liste d'ACL
:   Cette liste est sous la forme d'un tableau PHP d'ACL. Elle est propre à chaque application

Une liste de définition d'action
:   Cette liste est présentée sous la forme d'un tableau PHP d'action. La liste des actions est propre à chaque application.

Des paramètres applicatifs
: Les paramètres applicatifs sont présentés sous la forme d'une liste décrivant l'ensemble des paramètres applicatifs applicables pour l'application

NB : il est possible à une application d'hériter d'une autre, elle hérite alors de son paramétrage et des actions et paramètres applicatifs.

## ACL

Une ACL est un marqueur permettant d'indiquer que :

* un droit est nécessaire pour effectuer une action,
* un compte le possède et pourra donc effectuer les actions nécessitant l'ACL

La vérification des ACL est incluse dans la plate-forme et est effectuée automatiquement lors de l'appel à une action. Si le compte utilisé pour faire l'appel ne possède pas l'ACL nécessaire un message d'erreur est alors généré.

## Action

L'action est constituée d'une fonction PHP qui est utilisée lors de son appel.

Les principaux éléments constituant une action sont :

Un nom logique
:   celui-ci est utilisé pour référencer l'action. Il sera utilisé lors de l'appel de l'action.

Le nom logique d'une ACL (facultatif)
:   s'il est présent la plate-forme n'exécutera l'action que si le compte demandant l'exécution possède l'ACL.

Un nom de layout (facultatif)
:   il permet d'indiquer avec quel layout (template utilisé par le moteur de template) l'action sera rendue (par défaut, le template a le même nom que l'action).
    NB : si l'action n'a pas de représentation, ou renvoie un élément encodé (JSON, base64, etc.), il est possible de d'indiquer à l'action de ne pas utiliser le moteur de template.

## Paramètre applicatif

Un paramètre applicatif est un élément que l'on peut ajouter à une action pour stocker des données permettant de paramétrer l'action. Une fois le paramètre enregistré une API permet de le manipuler (récupérer, modifier sa valeur). De plus, les paramètres applicatifs sont présentés via les interfaces d'administration de Dynacase et peuvent être modifiés par les administrateurs système. Il est utilisé principalement dans deux cas :

* mettre en place une persistance au niveau d'une application pour l'ensemble des utilisateurs (par exemple le format du préfixe du nom de fichier que retourne une action d'export),
* mettre en place une persistance au niveau d'un utilisateur d'une application (par exemple les préférence d'export de l'utilisateur en cours).

Les principaux éléments constituant d'un paramètre applicatif sont :

Un nom logique
:   il permet de manipuler le paramètre applicatif

Une valeur par défaut
:   elle est utilisée pour initier la valeur du paramètre

Une visibilité
:   elle indique si un paramètre applicatif est ou pas commun à l'ensemble des utilisateurs