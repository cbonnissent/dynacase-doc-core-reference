# SearchDoc::search() {#core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08}

<div class="short-description">
Cette méthode permet d'exécuter la recherche.
</div>

## Description {#core-ref:aeb7ad6b-d951-4a5b-b17a-52cc4db4e51e}

    [php]
    array|null|SearchDoc search (  )

Cette méthode exécute la recherche. Elle construit le `SQL` nécessaire en
utilisant les paramètres du document et le contenu inséré par les différentes
méthodes.

### Avertissements {#core-ref:f9475914-b820-462f-a0b1-47c0a98d8836}

Une fois la recherche effectuée, il n'est plus possible de l'effectuer à nouveau
sans utiliser la méthode [`reset`][reset].

Par défaut [certains types de documents sont exclus des résultats de la
recherche][advancedExcluded].

## Liste des paramètres {#core-ref:1182a98e-413d-4fd5-8cf7-bf285852e5a3}

Aucun.

## Valeur de retour {#core-ref:9d82c815-d0af-49d7-983d-4a9bf85450a0}

La valeur du retour [dépend du type de recherche][advancedSearch] :

* résultats bruts : le retour est alors un array, si la préparation de la 
  recherche à échoué alors le résultat est un array vide,
* résultats documents : le retour est alors le document `searchDoc` ou `null` si 
la préparation de la recherche à échoué.

**Note** : Le changement du type de recherche se fait uniquement avant que la 
recherche ne soit déclenchée avec la méthode 
[`SearchDoc::setObjectReturn`][setObjectReturn].

## Erreurs / Exceptions {#core-ref:15419ed0-38bb-4890-9732-0779e83882dd}

Si la préparation de la recherche a échoué alors si la recherche :

* retourne des résultats brut : le retour est un array vide,
* retourne des documents : le retour est `null`.

## Historique {#core-ref:c718b9c4-c3aa-4666-ac81-9af3286235cb}

Aucun.

## Exemples {#core-ref:382458c1-64ec-4b59-ad90-33ac39265854}

Quelques exemples sont disponibles dans le chapitre 
[recherche avancée][advancedSearch].

## Notes {#core-ref:c3321a4a-316b-4ccf-a0f9-9b866863f223}

Aucune.

## Voir aussi {#core-ref:ad16b97f-7fc8-4240-97f0-a36c13084446}

*   Chapitre [Mécanismes de recherche][recherche].

<!-- links -->

[reset]:                #core-ref:18f98a7d-7db0-4270-97b2-0a1759a5b0e6
[advancedExcluded]:     #core-ref:d0a89548-a743-4dfc-bf43-49192ef1b6a8
[advancedSearch]:       #core-ref:7291dea8-a2db-46be-8194-bc6f100cc467
[setObjectReturn]:      #core-ref:3a0b4882-81ff-4030-9f60-a0ed0ff1f958
[recherche]:            #core-ref:bda916b0-e564-40fd-b195-c62bbab7b8be