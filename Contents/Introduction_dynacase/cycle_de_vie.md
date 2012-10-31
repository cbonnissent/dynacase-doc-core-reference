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

Les cycles de vie de Dynacase peuvent être représentés par des graphiques orientés (ceux-ci sont automatiquement générés par la plate-forme).

![ Exemple de de schéma de cycle de vie ](cycle_de_vie.png)

## Composants d'un cycle de vie

![ Composants du cycle vie ](cycle_de_vie_composant.png)

Un cycle de vie est composé des éléments suivants :

Propriétés
:   elles facilitent le paramétrage et l'export (famille associée, nom logique, etc.)

Structure
:   La structure est composée d'étapes et de transitions reliant les étapes. Elle constitue la base du cycle et indique comment le document peut évoluer.

Règles métiers
:   A chaque transition, il est possible d'indiquer des règles métier (sous la forme de fonctions PHP). Celles-ci peuvent être exécutées avant ou après le passage de la transition

Documents associés
:   Il est possible d'associer plusieurs types de document au cycle de vie. Les types sont :
    
    contrôle de vue/masque 
    :   ils permettent de changer la représentation du document en cours de cycle,
    
    profil
    :   un profil de document attaché au cycle permet de changer les permissions d'accès au document en cours de cycle,
    
    modèle de mail
    :   un modèle de mail attaché au cycle envoie un mail à un ou plusieurs destinataires à une étape ou lors d'une transition,
    
    minuteur
    :   un minuteur permet d'exécuter une action (envoi de mail par exemple) au bout d'un certains temps (ce temps peut varier suivant le document sur lequel le cycle s'exécute)

Profil dédié
:   Un profil dédié est ajouté au cycle, il permet de définir qui pourra effectuer quelle transition

## Étapes

Les étapes marquent une étape clef dans la vie du document. Une étape est constituée de :

État
:   l'état est le statut du document à un moment donné (brouillon, rédigé, validé, historique). Ils sont décrits sous la forme de constantes PHP utilisées pour construire le tableau du cycle

Activité (facultatif)
:   l'activité est la tâche en cours de réalisation sur un document donné (par exemple : en rédaction, en validation). Elles sont décrites sous la forme d'un tableau PHP associant les étapes avec les activités (et leurs traductions)

A une étape, on peut rattacher les éléments suivants :

mail (un ou plusieurs)
:   ils sont alors envoyé à chaque passage dans cette étape,
un profil il est alors attaché au document lors de son entrée dans l'étape et modifie la liste des comptes pouvant modifier, voir, supprimer le document en cours,

un contrôle de vue ou/un masque
:   il est alors attaché au document lors dans son entrée dans l'étape et modifie la représentation du document,

une couleur
:   celle-ci est reprise dans l'IHM et permet aux utilisateurs d'avoir un moyen mémo-technique simple pour identifier rapidement les documents,

accord
:   ces éléments sont utilisables pour demander de valider un accord <span class="fixme">A compléter, A déprécier ?</span>

Affectation
:   <span class="fixme">A compléter ? A quoi cela sert il ?</span>

NB : on considère qu'une étape sans activité doit être terminale (c'est à dire qu'il n'existe pas de transition permettant de sortir de cette étape), car c'est uniquement pendant ces étapes que le document n'évolue et qu'aucune activité ne s'y applique. Par exemple, un document **gardé pour historique** n'évolue plus et aucune activité ne s'y applique.

## Transition

Les transitions indiquent la possibilité de passage entre une étape et une autre. Une même transition peut-être utilisée entre plusieurs étapes différentes (par exemple, la transition retour au brouillon pourrait être utilisée pour passer de l'étape **validation N+1** à **rédaction** et de l'étape **validation N+2** à **rédaction**).

Une transition peut-être composée des éléments suivants :

<span class="fixme">AJOUTER un SCHEMA</span>

Pré-condition (ou M0)
:   la pré-condition ou M0 est une fonction PHP qui est systématiquement exécutée en début de transition, ce qui correspond aux cas suivants :
    
    * lors de l'affichage de la liste des transitions possibles à un état donné,
    * avant le déclenchement des ASK (voir entrée suivante),
    * avant le changement d'état en lui même
    
    Si la précondition n'est pas remplie alors elle renvoie un message qui est affiché à l'utilisateur.

ASK
:   Les ASK sont un ensemble d'attributs utilisés pour poser une question à l'utilisateur avant d'effectuer le changement d'état. Ils peuvent servir à valider une valeur, demander un commentaire, etc.

M1
:   le M1 est une fonction PHP qui est appelée après les ASK et le M0 mais avant le passage de la transition. On peut l'utiliser pour vérifier un ensemble d'éléments et annuler le passage d'une transition

M2
:   le M2 est une fonction PHP qui est appelée après le passage de la transition. Elle est utilisée pour modifier le document une fois la transition effectuée

Mails
:   

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