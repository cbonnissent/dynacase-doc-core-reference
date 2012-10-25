# Manuel de référence

## Préambule

## Introduction

Les points a aborder :

* Dynacase...
* Objet du manuel
* A qui il est destiné...

## Introduction à Dynacase

Cette partie est une partie théorique présentant les concepts et les techniques de DC sans rentrer dans leur implémentation. Elle se doit d'être suffisament simple, abordable et courte pour être parcourue en une 10aine de minutes et lue en 2/3 heures.

### Présentation des notions Dynacase, objets, organisation

#### Famille et document et attribut
#### Cycle de vies
#### Application / action
#### Compte / groupe / etc...
#### Sécurité ACL Profil etc...
#### Internationalisation
### Les modules Dynacase
#### Logique de build / d'architecture
### Moteur de template

    to be completed....

## API Manuel de référence

L'api du manuel est composée de l'ensemble des méthodes ayant l'annotation `@api` dans le code.

### Nom du chapitre

Introduction (TL;DR) de 1 ou 2 § rappelant l'utilité de la classe du chapitre en cours.

#### Nom de la méthode

1. Nom
2. L'applicabilité ( marquer new / deprecated )
3. Description courte
4. Description longue
  * Signature
  * La description elle-même
  * Warnings
5. Liste des paramêtres
6. Valeur de retour
7. Erreurs / Exceptions
8. Historique
9. Exemples
10. Notes
11. See also

Les éléments seront abordés dans l'ordre suivant :

1. DocManager
1. Doc
1. SearchDoc
1. Wdoc
1. Autres éléments
  * Timer,
  * Masque,
  * etc...
1. Account
1. SearchAccount
1. Application/Action

## Index des fonctions

## Techniques avancées avec Dynacase

### Préambule

 -> prévenir des limites de l'utilisation de ce qui abordé dans ce chapitre

Le but de ces chapitres est de d'aborder la conception technique de DC pour en faciliter la prise en main et le debug. L'idée est de permettre à un développeur tiers d'avoir une meilleure appréciation des conséquences à long et court terme des mécanismes qu'il utilise.

Chaque chapitre doit contenir :

* un TL;DR : résumé de 140 caractères expliquant ce qui va être expliqué,
* les structures de données impliquées,
* les éléments impliquées,
* la cinématique du déroulement du process expliqué,
* un chapitre sur les risques (rendu long, destruction de données, ...)

### Cinématique de dynacase
#### Que se passe t'il lors d'un appel à Dynacase
#### Que se passe t'il lors d'une consultation de document
#### Que se passe t'il lors d'un appel CLI (WSH)

### Mécanisme de persistance
#### Les objets Dynacase
#### QueryDB
#### DbObj
#### Doc

### Mécanisme de recherche
#### SearchDoc
#### Rapport/Recherche

### Mécanisme APPLICATION/ACTION
#### Rendu d'une transaction avec ACTION/APPLICATION

### Mécanisme des sessions
#### Connexion
#### Persistence
#### Nettoyage

### Mécanisme des familles
#### Éléments construits lors de l'importation
#### Mécanisme des recherches

### Mécanisme des workflow
#### Construction des workflow par dynacase
#### Fonctionnement des workflow

### Mécanisme de construction des IHM
#### Construction des formulaires par dynacase
#### Fonctionnement des formulaires

### Sécurité
#### Persistence
#### Calcul des droits

### Moteur de template
#### Parsing d'un template texte
#### Parsing d'un template ODT
#### Mécanisme de Zone