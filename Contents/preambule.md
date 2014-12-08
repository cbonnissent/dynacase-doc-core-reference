# Présentation {#core-ref:0557a832-8d4a-4df5-a9cb-84cee78c6fb2}

## Dynacase Platform {#core-ref:ca8e096e-d724-47ca-b4ff-f80f3768e2a7}

Dynacase est une plate-forme de développement d'applications métier dont l'objectif principal est de fournir un cadre facilitant et accélérant les développements.

Elle s'articule autour des composants suivants :

* un concept de *document* permettant à la fois la persistance des données et la génération de formulaire;
* des *workflows* permettant de faire évoluer les documents, d'automatiser l'application de règles métiers;
* un système de gestion de *sécurité* et des *utilisateurs* permettant d'indiquer finement les permissions;
* un système de *modules* permettant d'étendre les fonctionnalités de base.

Ces composants sont proposés et mis en oeuvre par le module principal *Dynacase Core*. 

## Manuel de référence de Dynacase Core {#core-ref:393e71e1-80ea-4617-a973-4219a719ab0f}

Ce manuel est destiné à des développeurs devant créer une application en
utilisant Dynacase comme socle applicatif.  Il a pour but de présenter une
documentation précise et exhaustive de l'ensemble des fonctionnalités de la
plate-forme maintenue par Anakeen.

Il propose au travers de sa structure une approche logique des concepts et
techniques de développement.

Les premiers chapitres présentent les objets et mécanismes Dynacase. Leur
compréhension est importante car ils introduisent des concepts qui sont
utilisés dans la suite du manuel.  Les suivants détaillent des fonctionnements
de Dynacase Core, pour arriver au détail de l'API de programmation  et aux
techniques avancées.

_Bon développement..._

## État de la documentation {#core-ref:599c689a-2ef6-430b-ab1a-93a67dc1178d}

Nous marquons les chapitres pour informer le lecteur sur les modifications
fonctionnelles.


|                    Balise                    |                                                                   Signification                                                                    |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| <span class="flag new">nouveauté</span>      | Ce marquage indique qu'une nouvelle fonction est disponible dans la version.                                                                       |
| <span class="flag update">mis à jour</span>  | Ce marquage indique qu'une fonction a évoluée dans la version.                                                                                     |
| <span class="flag from release">3.2.x</span> | Ce marquage met en évidence des fonctions nouvelles ou des mises à jour qui sont opérationnelles que depuis la release indiquée de *dynacase-core*. |



*Note* : Si un chapitre est 'marqué', son contenu, incluant ses sous-chapitres, est
considéré comme marqué à l'identique  -sauf marquage particulier-.



[^1]: Le Case Management est une évolutions des stratégies comme le BPM ou le travail collaboratif. 
Elle s'adapte de façon transverse à l'évolution des besoins de l'organisation, tout en permettant un 
contrôle et une traçabilité complète des opérations. Les outils de Case Management permettent de mettre 
en œuvre un très grand nombre de procédures comme le traitement des réclamations, l'ouverture de comptes, 
la gestion de projets, le suivi des faits techniques...
