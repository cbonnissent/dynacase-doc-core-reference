# ApplicationParameterManager::getUserParameterValue() {#core-ref:ad6d5849-bcdd-43d8-904b-61b0e9fea056}

<div markdown="1" class="short-description">
La méthode `getUserParameterValue()` permet de récupérer la valeur personnalisée
d'un paramètre d'une application.
</div>

## Description {#core-ref:a8e7d08e-ae37-43dc-a361-70f4af01919a}

    [php]
    string static getUserParameterValue ( mixed $application,
                                         string $parameterName,
                                         string $userId = null )

Retourne la valeur personnalisée du paramètre `$parameterName` appartenant à
l'application `$application`.

Pour obtenir la valeur principale d'un paramètre : voir méthode
[`getCommonParameterValue()`][getCommonParameterValue].

### Avertissements {#core-ref:bab3c6e0-3caa-4577-8fd1-dc927e1885d4}

Aucun.

## Liste des paramètres {#core-ref:41c61f78-9b3c-4e3c-952a-33e8c9874f3d}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la valeur personnalisée d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite avoir la valeur personnalisée.

(int) `userId`
:   L'identifiant de l'utilisateur pour lequel on souhaite avoir la valeur
    personnalisée du paramètre. Si l'identifiant n'est pas spécifié (ou si
    `null` est spécifié), alors c'est l'identifiant de l'utilisateur
    actuellement connecté qui est utilisé.

## Valeur de retour {#core-ref:6d2b3953-47ac-41b3-ad25-8d382c04e486}

Retourne une chaîne de caractères avec la valeur personnalisée du paramètre, ou
`null` si le paramètre ou l'application demandé n'est pas trouvé.

## Erreurs / Exceptions {#core-ref:e741cc00-4c1f-41bf-ba47-11fd2bf9003c}

Aucune.

## Historique {#core-ref:13dc4722-c389-4c79-b2d3-102ffb3014b7}

Aucun.

## Exemples {#core-ref:90dd8d15-3c06-482d-a558-7eefc35439a2}

    [php]
    /* Valeur principale de CORE_LANG */
    printf("CORE:CORE_LANG principal value    = '%s'\n", ApplicationParameterManager::getCommonParameterValue('CORE', 'CORE_LANG'));
    
    /* Valeur principale de CORE_LANG pour l'utilisateur courant */
    printf("CORE:CORE_LANG personalized value = '%s'\n", ApplicationParameterManager::getUserParameterValue('CORE', 'CORE_LANG'));
    
    /* Valeur appliquée de CORE_LANG pour l'utilisateur courant */
    printf("CORE:CORE_LANG applied value      = '%s'\n", ApplicationParameterManager::getParameterValue('CORE', 'CORE_LANG'));

Sortie :

    CORE:CORE_LANG principal value    = 'fr_FR'
    CORE:CORE_LANG personalized value = ''
    CORE:CORE_LANG applied value      = 'fr_FR'

## Notes {#core-ref:e9b4a41d-eccf-4913-be2a-0c4c48f4ceaf}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
    l'application *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER`
    (pour adresser des *paramètres globaux*).

## Voir aussi {#core-ref:77d588d2-3195-4abf-9145-cd50439eae02}

- [`ApplicationParameterManager::getCommonParameterValue`][getCommonParameterValue]
- [`ApplicationParameterManager::getParameterValue`][getParameterValue]

<!-- link -->

[getCommonParameterValue]: #core-ref:2a259dc7-8fb2-4658-86c7-4375d97d941a
[getParameterValue]: #core-ref:c5050c0d-e0f1-4fc7-8619-f11a1686173c