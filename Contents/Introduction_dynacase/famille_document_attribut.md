# Famille et document et attributs

## Résumé

Dynacase est composé de deux structures de base :

la famille
:   celle-ci correspond à une structure type permettant de stocker et de représenter des données structurées (par exemple le type compte-rendu de réunion, composé d'un titre, d'une liste de participants, d'une description, etc),

le document
:   il correspond à une instance d'un élément de famille (par exemple : le compte-rendu de la réunion marketing du 12 mai 2012 ayant pour invité Mickaël, Jean et Paul).

Les documents possèdent deux sous-catégories systèmes mises à disposition par core :

Les familles systèmes
:   il existe un certain nombre de familles mises à disposition par Dynacase-core par défaut. Ces familles sont utilisées par la plate-forme pour créer des documents utiles à son paramétrage interne et ne sont pas accessibles aux utilisateurs via les recherches et les interfaces par défaut.

les collections
:   les collections sont un type de document particulier qui a pour but de réunir des documents. Il en existe plusieurs types :
    
    Directory/Dossier
    :   Une dossier est une collection où l'ensemble des documents contenu est ajouté de manière volontaire par le code. Par exemple, le dossier *Mes éléments préférés* est généré par un morceau de code qui ajoute les documents à ce dossier
    
    Recherche
    :   Une recherche est une collection qui est définie par des critères de recherches. Le contenu de cette collection est donc re-calculé à chaque consultation. Par exemple, la recherche *Les documents dont je suis rédacteur* sera exprimé sous la forme d'une recherche permettant de trouver l'ensemble des documents où l'utilisateur en cours est cité comme rédacteur.

## La famille

Une famille est un objet de Dynacase permettant de décrire la structure et le comportement de documents.  
Si on s'appuie sur une analogie avec le paradigme objet, une famille est une classe.

![ Schéma théorique de famille ](famille.png "Schéma théorique de famille")

Nos pouvons voir dans le schéma ci-dessus qu'une famille Dynacase est constituée des éléments suivants :

des propriétés
:   elles définissent le comportement de la famille et des méta-données qui lui seront associées,

une structure
:   elle définit l'organisation et le type des données contenues par les documents de la famille.  
    Elle est composée de deux types d'éléments :
    
    les attributs
    :   ils sont de différent types (texte, date, énuméré, lien entre documents, etc.) et définissent le contenu de chaque document.  
        Par exemple, un compte-rendu de réunion est composé d' un titre de type *texte*, d'une date de réunion de type *date*, des annexes de type *fichier*,
    
    les paramètres
    :   ils définissent des éléments de même valeur pour tous les documents d'une même famille.  
        Par exemple, les compte-rendus ont comme préfixe pour leur titre : "CR_".

des représentations
:   ces éléments permettent de modifier la représentation d'un document, cela peut se matérialiser de différentes manières :
    
    * une mise en page simplifiée pour un certain type d'utilisateur (html par exemple),
    * une représentation sous la forme de données brutes pour de la communication entre systèmes (xml par exemple),
    * une représentation sous la forme d'un fichier bureautique ou PDF,
    * etc.

des contrôles de vues
:   ces éléments permettent d'indiquer à quel type d'utilisateur correspond quelle représentation.
    Par exemple, un manager peut voir plus d'éléments sur un compte-rendu qu'un simple participant.

des règles métiers
:   l'ensemble des règles s'appliquant à un type de document. Elles peuvent être de type très divers (ajout d'une règle de calcul de numéro chrono, ajout de contraintes particulières sur la mise en forme des données, calcul automatique d'une valeur, aide aux utilisateur pour la saisie des valeurs).  
    Elles s'implémentent de deux manières :
    
    * via une classe associée à la famille : celle-ci permet de surcharger les comportements par défaut de Dynacase lors des étapes de la vie du document (création, sauvegarde, édition, etc.),
    * via un fichier PHP tiers : celui-ci liste des méthodes permettant de guider la saisie des utilisateurs (par exemple rechercher uniquement les salles disponibles).

## Le document

Un document est un objet de Dynacase. Il contient de l'information structurée et est persistant. Il est principalement présenté aux utilisateurs sous la forme de formulaires web à compléter ou de pages web.  
Si on s'appuie sur une analogie avec le paradigme objet, un document est un objet.

Le document est une instance d'une famille. En reprenant l'exemple des compte-rendus un document de la famille *compte-rendu* est donc le compte-rendu du 12 mai 2012 se référant à une réunion précise.

L'objet document contient les éléments suivants :

des propriétés
:   la date de création, la date de dernière modification, le créateur, le profilage associé…

des données
:   l'ensemble des données contenues par le document,

l'historique
:   l'historique des actions ayant eu lieu autour du document (historique des modifications, des envoi de mail, etc.).

## Les types d'attributs

Un type d'attribut est une typologie de données. Il est utilisé dans les familles pour définir leur structure ; et dans les documents pour représenter, traiter et sauvegarder les données associées au document.

Il existe trois catégories d'attributs :

Structurant
:   Ces attributs permettent de structurer les familles. Il en existe deux catégories :
    
    Onglet
    :   ce type d'attribut permet de regrouper des attributs de type *frame*.  
        Il est représenté par un onglet dans les formulaires,
    
    Cadre
    :   ce type d'attribut permet de regrouper des attributs non-structurants.  
        Il est représenté par un cadre dans les formulaires,
    
    Ces attributs permettent de définir des ensembles sémantiques. Par exemple, dans le compte-rendu, le cadre Description regroupe le titre, la date et le lieu de la réunion.

Tableau
:   ce type d'attribut permet de créer une représentation tabulaire d'un ensemble d'attributs non-structurants. Ceux-ci deviennent alors les colonnes d'un tableau pouvant avoir plusieurs lignes.

Donnée
:   Ces attributs permettent de structurer les données récoltées au sein d'un formulaire. Ils permettent d'indiquer qu'une famille est composée d'un champ texte, d'un champ date, etc. Leur présence permet à la plate-forme de générer à la fois les formulaires et la structure en base de données permettant de stocker les documents.

## Les attributs

Un attribut correspond à un champ de données dans la définition d'une famille.Lors de sa définition au sein d'une famille, on lui adjoint des propriétés parmi les suivantes :

Type d'attribut
:   Il permet d'indiquer de quel type est l'attribut (texte, date, numérique, etc.),

Visibilité
:   Elle définit la manière dont l'utilisateur pourra interagir avec l'attribut, qui peut être soit éditable, en lecture seule, etc. Cet élément peut-être surchargé via les mécanismes des masques / contrôle de vue pour présenter une visibilité de manière dynamique (suivant l'état du document, ou la personne le consultant par exemple),

Label
:   Il est affiché à côté de l'attribut dans les représentations des documents. Cet élément peut être traduit,

Méthode de calcul (facultatif)
:   Un attribut ayant une méthode de calcul est dit *calculé*. Sa valeur est automatiquement calculée par Dynacase à chaque sauvegarde du document. Elle se présente sous la forme d'une méthode PHP renvoyant la nouvelle valeur,

Aide à la saisie (facultatif)
:   Un attribut possédant une aide à la saisie suggère des valeurs possibles aux utilisateurs lors de sa valorisation. L'aide à la saisie se présente sous la forme d'une méthode PHP renvoyant la liste des valeurs possibles,

Contrainte (facultatif)
:   Elle permet de valider l'information avant sa sauvegarde. Celle-ci se présente sous la forme d'une méthode PHP renvoyant un statut et, en cas de non respect de la contrainte, un message permettant de guider l'utilisateur dans le choix de la valeur,

Vue particulière (facultatif)
:   Si cette propriété est présente la représentation de l'attribut peut-être totalement ou partiellement surchargée (présentation d'un graphique dans le formulaire par exemple),

Options (facultatif)
:   Des options peuvent être adjointes à l'attribut pour modifier son comportement. Celles-ci sont propres à chaque type d'attribut et permettent d'en modifier soit le comportement ou l'affichage.

## Famille système

Une famille système a pour but créer de document utile au paramétrage de Dynacase mais dont le contenu n'est pas exploitable par les utilisateurs de base via les interfaces de recherche. C'est notamment utilisé dans Dynacase par les familles de base suivantes :

* contrôle de vue : ce document permet de définir la représentation d'un document,
* modèle de mail : qui permet de définir un modèle d'envoi par mail pour un type de document,
* etc.

Ces documents n'ayant pas de sens particulier pour les utilisateurs, ils ne sont pas accessibles aux utilisateurs via les recherches par défaut pour ne pas surcharger celle-ci avec des documents non pertinents.

NB : il est possible dans le cadre d'un développement Dynacase de définir ses propres familles systèmes

## Collection

Une collection est un document qui permet de stocker un ensemble de documents. Une collection est utilisée par Dynacase comme base pour des recherches particulières ou comme moyen de permettre à un utilisateur de faire des requêtes au niveau de Dynacase. Il existe notamment les types de collections suivants :

Dossier
:   Un dossier permet à un utilisateur ou à des règles métier d'ajouter et d'enlever des documents à l'intérieur de ce dossier.

Recherche
:   Une recherche permet à un utilisateur ou un intégrateur de paramétrer des règles permettant de regrouper un ensemble de document (par exemple : l'ensemble des *compte rendu* de réunion entre le 01/01/2042 et 31/12/2042).