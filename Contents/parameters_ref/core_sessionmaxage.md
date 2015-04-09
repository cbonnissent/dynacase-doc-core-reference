# `CORE_SESSIONMAXAGE`  {#core-ref:07bc6ece-f937-4c8b-8627-d39f9999f086}

## Description  {#core-ref:8a5753f7-6c70-4087-a8af-abd5f2bcdf63}

Durée de conservation d'une session n'ayant plus été utilisée.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `1 week`
*   Utilisateur : Non

Lorsqu'une session est utilisée, sa date d'accès est enregistrée à chaque
utilisation. Si une session n'a pas été détruite et n'est plus utilisée depuis
ce laps de temps, elle est supprimée lors du [garbage collector de
session][sessiongc].

## Valeur  {#core-ref:360f436e-c6d8-439f-b3df-98d2f2f1eaba}

La valeur est une chaîne de caractères qui contient une durée exprimée sous une
forme naturelle en anglais.

Les unités possibles sont `minute`, `hour`, `day`, `week` ou `month`.

Exemple : `2 days`, `1 week`, `3 days 12 hours`


## Notes  {#core-ref:eebb7895-9c83-4ff7-9db4-62c437418886}

Voir aussi [`CORE_SESSIONTTL`][sessionttl]

<!-- links -->
[sessionttl]: #core-ref:f8ec257f-45f7-4fee-b37b-9ea251b70e3b
[sessiongc]: #core-ref:143e8a1d-7c75-4707-bcf2-8a96847bb58e
