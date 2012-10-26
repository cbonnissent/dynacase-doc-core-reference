# Introduction à Dynacase

Ce chapitre présente l'ensemble des notions de base composant Dynacase de manière succincte. Il permet a un nouvel utilisateur de faire un rapide tour de présentation de la plate-forme.

### Famille et document et attributs

#### Résumé

Dynacase est composé de deux structures de base :

la famille
:   celle-ci correspond à une structure type permettant de stocker et de représenter des données structurées (par exemple le type compte rendu de réunion, composé d'un titre, d'une liste de participant, d'une description, etc),

les documents
:   ils correspondent à une instance d'un élément de famille (par exemple : le compte rendu de la réunion marketing du 12 mai 2012 ayant pour invité Mickaël, Jean et Paul).

#### Famille

Une famille est un objet interne de Dynacase permettant de décrire la structure et le comportement des Documents. Si on s'appuie sur une analogie avec le paradigme objet, une famille est une classe.

![ Schéma théorique de famille ](famille.png "Schéma théorique de famille")

Nos pouvons voir dans le schéma ci-dessus qu'une famille Dynacase est constituée des éléments suivants :

des propriétés
:   définissent le comportement de la famille et des méta-data qui lui seront associées,

une structure
:   définit la structure des données que contiendront les documents de la famille, elle est composée de deux types d'éléments :
    
    les attributs
    :   ils sont de différents types (texte, date, énuméré, lien entre documents, ...) et définissent le contenu de chaque document. Par exemple, un compte rendu de réunion est composé d'un titre de type texte, d'une date de réunion, d'une liste de participants,
    
    les paramètres
    :   ils définissent des éléments de même valeur pour tous les documents d'une même famille. Par exemple, les compte rendu ont comme préfixe pour leur titre : CR_.

des représentations
:   ces éléments permettent de modifier la représentation d'un document, cela peut se concevoir de différentes manière :
    * une mise en page simplifiée pour un certain type d'utilisateur,
    * une représentation sous la forme de données brutes pour de la communication entre système,
    * une représentation sous la forme d'un fichier bureautique ou PDF.
    * etc

des contrôles de vues
:   ces éléments permettent d'indiquer à quel type d'utilisateur correspond quelle vue. Par exemple, un manager peut voir plus d'élément sur un compte rendu qu'un simple participant.

des règles métiers
:   l'ensemble des règles s'appliquant à un type de document. Celles-ci peuvent de type très divers (ajout d'une règle de calcul de numéro chrono, ajout de contraintes particulière sur la mise en forme des données, calcul automatique de valeur, aide aux utilisateur pour la saisie des valeurs). Elles s'implémentent de deux manières :
    * via une classe associée à la famille : celle-ci permet de surcharger les comportements par défaut de Dynacase lors des étapes de la vie du document (création, sauvegarde, édition, etc),
    * via un fichier PHP tiers : celui-ci liste des méthodes permettant de guider la saisie des utilisateurs (par exemple ne sélectionner que les utilisateurs admissible pour une réunion de type marketing et pas l'ensemble des utilisateurs de la base).

#### Documents

Un document est un objet interne de Dynacase. Il contient de l'information structurée et est persistant, il est principalement présenté aux utilisateurs sous la forme de formulaire web à complété ou de pages web.
Si on s'appuie sur une analogie avec le paradigme objet, un document est un objet.

Le document est une instance d'une famille. En reprenant l'exemple des comptes rendus un document de la famille **compte rendu** est donc le compte rendu du 12 mai 2012 présentant une réunion précise, l'objet document contient les éléments suivants :

des propriétés
:   la date de création, la date de dernière modification, le créateur, le profilage associé, ...

des données
:   l'ensemble des données contenues par le document

l'historique
:   l'historique des actions ayant eu lieu autour du document (historique des modifications, des envoi de mail, etc)

#### Les attributs

Un attribut est une typologie de données. Il est utilisé dans les définitions de famille pour définir la structure associée à la famille et dans les documents pour représenter, traiter et sauvegarder les données associées au document.

Un attribut au sens de Dynacase contient les éléments suivants 