# ApplicationParameterManager::resetCache() {#core-ref:64c9ee8f-87b1-4d07-bece-98581990f59e}

<div markdown="1" class="short-description">
La méthode `resetCache()` permet de vider le cache des valeurs des paramètres.
</div>

## Description {#core-ref:5e640022-dea6-490a-9b9b-5607cb6b2713}

    [php]
    void static resetCache ()

Lorsque des paramètres sont interrogés, via les méthodes de la classe
`ApplicationParameterManager`, les résultats sont mis en cache afin de minimiser
les requêtes en base de données lorsque ces mêmes paramètres sont ré-interrogés.

La méthode `resetCache()` permet alors de vider ce cache, et donc de forcer à ce
que les méthodes appelées fassent des requêtes sur la base de données pour
interroger la valeur d'un paramètre.

### Avertissements {#core-ref:c04ea10e-6e97-4ec4-b8f0-c320262db0ce}

Le cache n'est pas partagé entre les différentes requêtes. Chaque requête à son
propre cache, et des incohérences peuvent donc apparaître lors de la lecture ou
l'écriture d'un même paramètre par deux requêtes concurrentes.

## Liste des paramètres {#core-ref:17cc55d4-6cfd-4e1d-8b9c-438e4e89e5c3}

La méthode ne prend pas d'argument.

## Valeur de retour {#core-ref:4f0d71f6-b2d6-4d9c-8ec0-0cb87519451c}

La méthode ne retourne rien.

## Erreurs / Exceptions {#core-ref:4e9b0fc5-79fb-4451-8007-6fc57e10ca12}

Aucune.

## Historique {#core-ref:a3597d69-8c45-4841-b2ae-381c3687b7be}

Aucun.

## Exemples {#core-ref:8bca7f28-f21e-4ef6-809c-7863d9e3658e}

    [php]
    ApplicationParameterManager::resetCache();

## Notes {#core-ref:7761ed32-ec8c-452f-91fb-b03681c216a5}

Aucune.

## Voir aussi {#core-ref:67053afb-2c64-4d39-8172-23a858083309}

Aucun.
