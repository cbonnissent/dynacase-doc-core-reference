# ApplicationParameterManager::getScopedParameterValue() {#core-ref:709811ab-0552-4161-b7d8-0f33a73936b1}

<div markdown="1" class="short-description">
La méthode `getScopedParameterValue()` permet de lire la valeur des paramètres
accessibles dans le contexte courant.
</div>

## Description {#core-ref:73e6fcb7-e805-41f3-b819-c75c42b8017e}

    [php]
    string static getScopedParameterValue ( string $parameterName )

Retourne la valeur du paramètre `$parametreName` accessible dans le contexte
courant.

Le contexte courante contient :

*   Les paramètres de l'application courante (valeurs principales) ;
*   Les paramètres volatiles ;
*   Les paramètres globaux.

### Avertissements {#core-ref:1013a752-57ce-46f4-b596-f66d6623a9b4}

Aucun.

## Liste des paramètres {#core-ref:c7b7ce3c-85de-4b25-a187-5728690f1808}

(string) `parameterName`
:   Le nom du paramètre dont on souhaite obtenir la valeur.

## Valeur de retour {#core-ref:65873b63-c919-4dfd-bdb7-03b9a6b79e75}

Retourne une chaîne de caractères contenant la valeur du paramètre.

Si une chaîne vide est retournée, c'est que soit le paramètre n'a pas été
trouvé, soit que la valeur du paramètre est effectivement une chaîne vide.

## Erreurs / Exceptions {#core-ref:2df29a4c-6761-444f-b9d5-615cb99e6cc2}

Aucune.

## Historique {#core-ref:0c015762-0994-49c3-9dc8-b9a63dec9a2a}

Aucun.

## Exemples {#core-ref:00520a8b-bee1-42ab-b600-9105996dec63}

    [php]
    printf("CORE_ABSURL = '%s'", ApplicationParameterManager::getScopedParameterValue('CORE_ABSURL'));

Sortie :

    CORE_ABSURL = 'http://www.example.net/'

## Notes {#core-ref:be5ec026-534d-437c-b383-ad46e64ac915}

Aucune.

## Voir aussi {#core-ref:ce357e1e-59b8-41cc-87bf-4ba1413ee7a8}

Aucun.
