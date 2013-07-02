# ApplicationParameterManager::getUserParameterDefaultValue() {#core-ref:d713087a-7e31-4559-bf5f-32fd829e88b5}

<div markdown="1" class="short-description">
La méthode `getUserParameterDefaultValue()` permet de récupérer la valeur
principale d'un paramètre d'une application.
</div>

## Description {#core-ref:549bb53c-6e9c-41c7-92e4-71053d0b751d}

    [php]
    string getUserParameterDefaultValue ( mixed $application,
                                         string $parameterName )

Retourne la valeur principale du paramètre `$parameterName` appartenant à
l'application `$application`.

### Avertissements {#core-ref:02e347d4-470a-4042-984d-06abdb81eca0}

Aucun.

## Liste des paramètres {#core-ref:b235d138-0167-49c8-980d-4ea0c08793c5}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la valeur principale d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite avoir la valeur principale.

## Valeur de retour {#core-ref:c4169c6c-8611-4cc9-a7f5-bc4633678389}

Retourne une chaîne de caractères avec la valeur principale du paramètre, ou
`null` si le paramètre ou l'application demandé n'est pas trouvé.

## Erreurs / Exceptions {#core-ref:dfa172bf-3249-4cd3-b619-8eb486ec96c2}

Aucune.

## Historique {#core-ref:04657b9b-6281-4c1f-97d0-63866c07cf91}

Aucun.

## Exemples {#core-ref:e66be0e1-f6a2-48d3-bc34-ab4d6cd5d4e9}

    [php]
    /* Valeur principale du paramètre CORE_LANG */
    $paramVal = ApplicationParameterManager::getUserParameterDefaultValue('CORE', 'CORE_LANG');
    printf("CORE:CORE_LANG principal value    = '%s'\n", $paramVal);
    
    /* Valeur personnalisée de CORE_LANG pour l'utilisateur courant */
    $paramVal = ApplicationParameterManager::getUserParameterValue('CORE', 'CORE_LANG');
    printf("CORE:CORE_LANG personalized value = '%s'\n", $paramVal);
    
    /* Valeur finale du paramètre CORE_LANG appliquée sur l'utilisateur */
    $paramVal = ApplicationParameterManager::getParameterValue('CORE', 'CORE_LANG');
    printf("CORE:CORE_LANG final value        = '%s'\n", $paramVal);

Sortie :

    CORE:CORE_LANG principal value    = 'fr_FR'
    CORE:CORE_LANG personalized value = ''
    CORE:CORE_LANG final value        = 'fr_FR'

Cet exemple montre que la valeur finale appliquée sur l'utilisateur est la
valeur principale, puisqu'il n'y a pas de valeur personnalisée explicitement
déclarée sur l'utilisateur.

## Notes {#core-ref:4d1dea92-5f75-4eb0-9792-5003a43c845b}

*   L'argument `application` peut aussi être la constante
`ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
l'application courante) ou `ApplicationParameterManager::GLOBAL_PARAMETER` (pour
adresser des paramètres globaux).

*   Cette méthode est équivalente à un appel à la méthode
[`getCommonParameterValue()`][getCommonParameterValue].

## Voir aussi {#core-ref:119c6138-c7f9-4660-9645-94ae0eff13b0}

- [`ApplicationParameterManager::getCommonParameterValue`][getCommonParameterValue]
- [`ApplicationParameterManager::getUserParameterValue`][getUserParameterValue]
- [`ApplicationParameterManager::getUserParameterDefaultValue`][getUserParameterDefaultValue]
- [`ApplicationParameterManager::getParameterValue`][getParameterValue]

<!-- links -->

[getCommonParameterValue]: #core-ref:2a259dc7-8fb2-4658-86c7-4375d97d941a
[getUserParameterValue]: #core-ref:ad6d5849-bcdd-43d8-904b-61b0e9fea056
[getUserParameterDefaultValue]: #core-ref:d713087a-7e31-4559-bf5f-32fd829e88b5
[getParameterValue]: #core-ref:c5050c0d-e0f1-4fc7-8619-f11a1686173c