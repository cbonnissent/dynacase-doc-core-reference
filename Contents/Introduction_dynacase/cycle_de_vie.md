# Cycle de vie

## Résumé

Ce chapitre décrit un élément fondamental d'un projet Dynacase : **le cycle de vie**.

Le cycle de vie est un objet interne à Dynacase qui permet de faire évoluer un document au sein d'un processus. Lors de ce processus, différentes actions peuvent être appliquées au document :

* changement/calcul de valeurs (le numéro chrono n'est affecté qu'après la validation du document),
* changement des droits associés à un document (un document en rédaction ne peut-être modifiable que par son rédacteur),
* évolution du formulaire (l'onglet validation n'apparaît que lors de l'étape validation),
* envoi de courriel (le validateur d'un document reçoit un courriel lorsque son avis est nécessaire),
* déclenchement d'un minuteur (si après 1 mois le document est toujours en validation, le valideur est relancé),
* plus généralement du code PHP peut-être déclenché (envoi à un autre élément du système d'informations de l'ordre de paiement après validation finale du document).

Les cycles de vie de Dynacase peuvent être représentés par des graphiques orientés (ceux-ci sont automatiquement générés par la plate-forme).

![ Exemple de schéma de cycle de vie ](cycle_de_vie.png)

## Composants d'un cycle de vie

![ Composants du cycle vie ](cycle_de_vie_composant.png)

Un cycle de vie est composé des éléments suivants :

Propriétés
:   Elles facilitent le paramétrage et l'exportation (famille associée, nom logique, etc.).

Structure
:   La structure est composée d'étapes et de transitions reliant les étapes. Elle constitue la base du cycle et indique comment le document peut évoluer.

Profil dédié
:   Un profil dédié est ajouté au cycle, il permet de définir qui pourra effectuer quelle transition.

## Étapes

Les étapes marquent un moment clef dans la vie du document. Une étape est constituée de :

État
:   L'état est le statut du document à un moment donné (brouillon, rédigé, validé, historique).

Activité
:   L'activité est la tâche en cours de réalisation sur un document donné (par exemple : en rédaction, en validation).

À une étape, on peut rattacher les éléments suivants :

Courriel (un ou plusieurs)
:   Ils sont alors envoyés à chaque passage dans cette étape,

Un profil 
:   Il est alors attaché au document lors de son entrée dans l'étape et modifie la liste des comptes pouvant modifier, voir, supprimer le document en cours.

Un contrôle de vue ou/un masque
:   Il est alors attaché au document lors dans son entrée dans l'étape et modifie la représentation du document.

Couleur
:   Celle-ci est reprise dans l'IHM et permet aux utilisateurs d'avoir un moyen mémo-technique simple pour identifier rapidement les documents.

Affectation
:   L'affectation d'un utilisateur à une étape permet de réserver le document à cet utilisateur et d'éventuellement verrouiller le document à l'intention de cet utilisateur et de lui envoyer un courriel.

NB : On considère qu'une étape sans activité doit être terminale (c'est à dire qu'il n'existe pas de transition permettant de sortir de cette étape), car c'est uniquement durant ces étapes que le document n'évolue plus et que donc qu'aucune activité ne s'y applique. Par exemple, un document **gardé pour historique** n'évolue plus et aucune activité ne s'y applique.

## Transition

Les transitions indiquent la possibilité de passage entre une étape et une autre. Une même transition peut-être utilisée entre plusieurs étapes différentes (par exemple, la transition **Contrôle** pourrait être utilisée pour passer de l'étape **validation N+1** à **rédaction** et de l'étape **validation N+2** à **rédaction**).

Une transition se déroule de la manière suivante :

![ Déroulement d'une transition ](cycle_transition.png)

M0 (ou Pré-condition)
:   La pré-condition ou M0 est une fonction PHP qui est systématiquement exécutée en début de transition, ce qui correspond aux cas suivants :
    
    * lors de l'affichage de la liste des transitions possibles à une étape donnée,
    * avant le déclenchement des ASK (voir entrée suivante),
    * avant le changement d'état en lui même
    
    Si la précondition n'est pas remplie alors elle renvoie un message qui est affiché à l'utilisateur et ne permet pas d'effectuer la transition

ASK
:   Les ASK sont un ensemble d'attributs utilisés pour poser une question à l'utilisateur avant d'effectuer la transition. Ils peuvent servir à valider une valeur, demander un commentaire, etc. Les valeurs récupérées peuvent être utilisées dans les méthodes du cycle de vie lors des M1, M2, M3.

M1
:   Le M1 est une méthode PHP qui est appelée après les ASK et le M0 mais avant le changement d'état. On peut l'utiliser pour vérifier un ensemble d'éléments et annuler le passage d'une transition si besoin. Par exemple, on peut vérifier la présence d'un élément dans le document en cours de transition et annuler le passage de la transition si celui-ci n'est pas présent.

M2
:   Le M2 est une méthode PHP qui est appelée après le changement d'état. Elle est utilisée pour modifier le document une fois la transition effectuée mais avant les courriels et les minuteurs, elle est utilisée pour modifier le contenu du document avant l'envoi des courriels.

Courriel
:   Il est possible d'attacher des courriels au passage d'une transition. Ceux-ci sont alors envoyés à chaque passage de cette transition, le contenu et les destinataires peuvent être composés à l'aide du contenu du document en cours de transition.

Minuteur
:   Il est possible d'attacher des minuteurs au passage d'une transition. Ceux-ci servent à déclencher une action de manière asynchrone (au bout d'un certain temps). Un des usages les plus typiques et la relance par mail (par exemple, si jamais le document est toujours à l'état relecture au bout de 15 jours le relecteur reçoit à nouveau un mail l'invitant à relire le document).

M3
:   Le M3 est une méthode PHP qui est appelée en tout dernier lors d'une transition. Elle est utilisée pour effectuer une action après le passage de la transition, l'envoi des mails et des minuteurs.

NB : M2 et M3 peuvent retourner un message, contrairement à celui de M0 et M1 il n'empêchera pas le passage de la transition mais sera présenté à l'utilisateur.

## Cycle de vie, famille et document

Le cycle de vie se matérialise sous la forme d'un document Dynacase.

Ce document est ensuite lié à une ou plusieurs familles : tous les nouveaux documents de cette ou ces famille(s) :

* sont affectés à ce cycle de vie;
* sont automatiquement affecté à la première étape de ce cycle après leur création;
* utilisent ce cycle pour définir :
    * leur représentation,
    * leur accessibilité (qui a le droit de voir, modifier, supprimer).

NB : il est aussi possible d'affecter un cycle de vie à un document via de la programmation.
