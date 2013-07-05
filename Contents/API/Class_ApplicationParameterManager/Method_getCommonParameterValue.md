# ApplicationParameterManager::getCommonParameterValue() {#core-ref:2a259dc7-8fb2-4658-86c7-4375d97d941a}

<div markdown="1" class="short-description">
La méthode `getCommonParameterValue()` permet de récupérer la valeur principale
d'un paramètre.
</div>

## Description {#core-ref:124fd3e5-dc27-4741-adf7-06f5c6b26213}

    [php]
    string static getCommonParameterValue ( mixed $application,
                                           string $parameterName )

Retourne la valeur principale du paramètre `$parameterName` défini sur
l'application `$application`.

Pour obtenir la valeur personnalisée d'un utilisateur : voir la méthode
[`getUserParameterValue()`][getUserParameterValue].

### Avertissements {#core-ref:15f56ddc-9ed7-485f-b549-495426f96c4b}

Aucun.

## Liste des paramètres {#core-ref:5a80de46-3aed-4144-abac-ee85f1923d2d}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la valeur principale d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite avoir la valeur principale.

## Valeur de retour {#core-ref:4a6af5ed-d872-4465-aa84-1ea46074ecc3}

Retourne une chaîne de caractères avec la valeur principale du paramètre, ou
`null` si le paramètre ou l'application demandé n'est pas trouvé.

## Erreurs / Exceptions {#core-ref:85accf8f-5545-4978-8ae7-fb82e60ecc19}

Aucune.

## Historique {#core-ref:2664c36e-a0e1-478f-9583-364328b81c56}

Aucun.

## Exemples {#core-ref:b1db553d-2095-4e42-b47e-2fadba26a9d3}

    [php]
    /* En utilisant le nom de l'application */
    printf("CORE:CORE_START_APP = '%s'\n", ApplicationParameterManager::getCommonParameterValue('CORE', 'CORE_START_APP'));
    
    /* ou en utilisant l'objet Application de l'action courante */
    printf("CORE:CORE_START_APP = '%s'\n", ApplicationParameterManager::getCommonParameterValue($action->parent, 'CORE_START_APP'));

Sortie :

    CORE:CORE_START_APP = 'APP_SWITCHER'
    CORE:CORE_START_APP = 'APP_SWITCHER'

## Notes {#core-ref:5a8679a3-25f0-400e-9f2f-b1d936f0d5f1}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
    l'application *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER`
    (pour adresser des *paramètres globaux*).

## Voir aussi {#core-ref:78918f97-5dcc-4ae8-b575-49c110b8dbef}

- [`ApplicationParameterManager::getUserParameterValue()`][getUserParameterValue]

<!-- links -->
[getUserParameterValue]: #core-ref:ad6d5849-bcdd-43d8-904b-61b0e9fea056