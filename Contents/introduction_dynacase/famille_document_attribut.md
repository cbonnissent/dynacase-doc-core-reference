# Famille et document et attributs

## Résumé

Dynacase est composé de deux structures de base :

la famille
:   celle-ci correspond à une structure type permettant de stocker et de représenter des données structurées (par exemple le type compte-rendu de réunion, composé d'un titre, d'une liste de participants, d'une description, etc),

le document
:   il correspond à une instance d'un élément de famille (par exemple : le compte-rendu de la réunion marketing du 12 mai 2012 ayant pour invité Mickaël, Jean et Paul).

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
        Par exemple, un compte-rendu de réunion est composé d' un titre de type *texte*, d'une date de réunion de type *date*, d'une liste de participants de type *utilisateur*,
    
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
:   ces éléments permettent d'indiquer à quel type d'utilisateur correspond quelle vue.  
    Par exemple, un manager peut voir plus d'éléments sur un compte-rendu qu'un simple participant.

des règles métiers
:   l'ensemble des règles s'appliquant à un type de document. Elles peuvent être de type très divers (ajout d'une règle de calcul de numéro chrono, ajout de contraintes particulières sur la mise en forme des données, calcul automatique d'une valeur, aide aux utilisateur pour la saisie des valeurs).  
    Elles s'implémentent de deux manières :
    
    * via une classe associée à la famille : celle-ci permet de surcharger les comportements par défaut de Dynacase lors des étapes de la vie du document (création, sauvegarde, édition, etc.),
    * via un fichier PHP tiers : celui-ci liste des méthodes permettant de guider la saisie des utilisateurs (par exemple ne sélectionner que les utilisateurs admissible pour une réunion de type marketing et pas l'ensemble des utilisateurs de la base).

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
:   Ces attributs permettent de structurer les familles, il en existe trois catégories :
    
    Onglet
    :   ce type d'attribut permet de regrouper des attributs de type *frame*.  
        Il est représenté par un onglet dans les formulaires,
    
    Cadre
    :   ce type d'attribut permet de regrouper des attributs non-structurants.  
        Il est représenté par un cadre dans les formulaires,
    
    Ces attributs permettent de définir des ensembles sémantiques. Par exemple, dans le compte-rendu, le cadre Description regroupe le titre, la date et le lieu de la réunion.

Tableau
:   ce type d'attribut permet de créer un représentation tabulaire d'un ensemble d'attributs non-structurants. Ceux-ci deviennent alors les colonnes d'un tableau pouvant avoir plusieurs lignes.

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
:   Des options peuvent être adjointes à l'attribut pour modifier son comportement. Celles-ci sont propres à chaque type d'attribut et listée dans le chapitre <span class="fixme">Insérer le lien</span>.