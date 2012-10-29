# Cycle de vie

## Résumé

Après avoir abordé la famille et le document, nous allons nous intéresser à un autre élément fondamental d'un projet Dynacase : **le cycle de vie**.

Le cycle de vie est un objet interne à Dynacase qui permet de faire évoluer un document au sein d'un processus. Durant, ce processus différentes actions peuvent être appliquées au document :

* changement/calcul de valeurs (le numéro chrono ne peut être affecté uniquement après la validation du document),
* changement de visibilités (un document en brouillon ne peut-être visible que par son rédacteur),
* évolution du formulaire (l'onglet validation n'apparaît que lors de l'étape validation),
* envoi de mail (le validateur d'un document reçoit un mail lorsque son avis est nécessaire),
* déclenchement d'un timer (si après 1 mois le document est toujours en validation, le validateur est relancé),
* plus généralement du code PHP peut-être déclenché (envoi à un autre élément du SI de l'ordre de paiement après validation finale du document).

Les principaux éléments de vocabulaires utilisés dans la définition d'un cycle de vie sont les suivants :

Étape
:   l'étape est un moment clef de la vie document. Elle peut désigner soit une activité, soit un état du document,

Activité
:   on parle d'activité lorsque le document est en cours de traitement (rédaction , contrôle)

État
:    on parle d'état lorsque le document est inerte, soit parce que l'on consulte des anciennes révisions du document soit parce qu'on est est sur un état final

Les cycles de vie de Dynacase peuvent être représentés par des graphiques orientés (ceux-ci sont automatiquement générés par la plate-forme).

![ Exemple de de schéma de cycle de vie ](cycle_de_vie.png)

## Composants d'un cycle de vie

![ Composants du cycle vie ](cycle_de_vie_composant.png)

Un cycle de vie est composé des éléments suivants :

Propriétés
:   les propriétés sont de deux natures :

    * celles facilitant le paramétrage et l'export (famille associée, nom logique, etc.),
    * celles indiquant les droits s'appliquant au cycle (qui peut effectuer quel changement d'étape).

État
:   l'état est le statut du document à un moment donné (brouillon, rédigé, validé, historique). Ils sont décrits sous la forme de constantes PHP utilisées pour construire le tableau du cycle,

Activités
:   l'activité est la tâche en cours de réalisation sur un document donné (par exemple : en rédaction, en validation). Elles sont décrites sous la forme d'un tableau PHP associant les étapes avec les activités (et leurs traductions),

Transition
:   une transition décrit les conditions de passage d'une étape à une autre. Elles sont décrites sous la forme d'un tableau PHP associant le nom logique de la transition aux différents éléments la constituant.

Cycle
:   le cycle est un tableau PHP associant deux états et une transition. Il permet de construire le graphique orienté du cycle de vie et de déduire quelles sont les étapes auquel un utilisateur peut accéder à un moment donné,

Profils
:   Des profils peuvent être associés au cycle de vie. Ces profils s'attachent au document lors du passage dans un nouvel état et permettent de définir qui peut effectuer quel action sur le document,

Contrôle de vue et masque
:   Des contrôles de vue ou des masques peuvent être attaché au document par le cycle de vie. Ceux-ci permettent de modifier la présentation des formulaire

Mail
:   Des mails peuvent être attachés au cycle de vie. Ils permettent d'envoyer un mail d'avertissement, soit à une adresse fixe, soit à une personne, ou un groupe de personnes citée ou pas dans le document. Il existe deux moyens de les attacher :

    * soit sur une transition, le mail est alors envoyé à chaque fois que l'on passe par cet état,
    * soit sur une étape, le mail est alors envoyé à chaque passage dans cet étape (quelque soit le moyen d'accès à l'étape).

Minuteurs
:   Des minuteurs peuvent être attachés au cycle de vie. Ils permettent d'effectuer des actions une fois un certain temps écoulé (le temps peut dépendre de la valeur d'un élément du document en cours), les actions peuvent être de tous type mais la plus courante est un envoi de mail. Il existe deux types de les attacher :

    * soit des minuteurs persistants : ceux-ci restent après un changement d'étape,
    * soit des minuteurs détachable : ceux-ci se détachent après un changement d'étape

Couleur
:   Il est possible de définir un couleur par étape. Celle-ci est reprise dans l'IHM et permet aux utilisateurs d'avoir un moyen mémo-technique simple pour identifier rapidement les documents

Accord
:   Ces éléments sont utilisables pour demander de valider un accord <span class="fixme">A compléter, A déprécier ?</span>

Affectation
: <span class="fixme">A compléter ? A quoi cela sert il ?</span>

NB : Au niveau de l'implémentation les étapes restent "théoriques" et n'ont pas de structure de données qui les décrivent (elles sont déduites par Dynacase du tableau de cycle et de celui d'activité).

## Définition d'un cycle de vie

La définition et la création d'un cycle de vie passent par quelques étapes fonctionnelles et techniques. En effet, le cycle de vie étant un objet relativement complexe et structurant pour un document Dynacase, il est important de bien l'appréhender dès sa création.

### Définition fonctionnelle du cycle de vie

Il est important dès la création du cycle d'avoir une idée précise des points suivants :

* cinématique des étapes et concordances de celles-ci avec la réalité fonctionnelle,
* attribution des visibilités et droits d'édition.

A l'usage, il semble intéressant de privilégier les points suivants :

* laisser de la liberté et de la souplesse. En effet un cycle qui contraint trop les utilisateurs oblige à couvrir l'ensemble des cas particuliers et engendre rapidement beaucoup de développement,
* changer les visibilités des éléments du document par groupe sémantique. Il est plus facile de modifier la visibilité d'un seul élément structurant que de changer les visibilité par attribut (par exemple, il est plus facile de montrer/cacher l'ensemble du groupe sémantique de validation que de montrer/cacher le validateur, la date de validation, les fichiers joints à la validation, etc.),
* éviter la surcharge d'information, trop d'envoi de mail entraîne un difficulté à traiter l'information pour les destinataires,
* éviter les cycles trop complexes. Un trop grande complexité du cycle entraîne des difficultés de lisibilité pour les utilisateurs, il est souvent intéressant de scinder un cycle complexe et en plusieurs sous-cycle plus simple