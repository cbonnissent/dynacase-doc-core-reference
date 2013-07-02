# ApplicationParameterManager::getParameterValue() {#core-ref:c5050c0d-e0f1-4fc7-8619-f11a1686173c}

<div markdown="1" class="short-description">
La méthode `getParameterValue()` permet de récupérer la valeur d'un paramètre
d'une application.
</div>

## Description {#core-ref:2a96ab13-2370-44ef-b404-60d1bd50f046}

    [php]
    string static getParameterValue ( mixed $application,
                                     string $parameterName )

Retourne la valeur du paramètre `$parameterName` appartenant à l'application
`$application` en suivant la logique de
[Valeur principale et valeur personnalisée][valeurPrincipaleEtValeurPersonnalisée].

### Avertissements {#core-ref:96e0fa7b-0674-42a9-a6c5-356b4e3cbebc}

Aucun.

## Liste des paramètres {#core-ref:c2e3d3ea-511a-4a25-932a-dae1fd7d719b}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la valeur d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite avoir la valeur.

## Valeur de retour {#core-ref:fdcc9b19-4383-481c-9bb2-394f143d1c8b}

Retourne une chaîne de caractère contenant la valeur du paramètre.

Si l'application ou le paramètre spécifiés n'existent pas alors la valeur `null`
est retournée.

## Erreurs / Exceptions {#core-ref:fbabb397-a373-4d37-86ae-a54ea2b8c1f5}

Aucune.

## Historique {#core-ref:d2ed42dc-0d83-4bc1-8dbb-5393e81592cf}

Aucun.

## Exemples {#core-ref:4f2bd6fb-e352-46b3-94fd-9b704942a6bf}

    [php]
    /* Paramètre utilisateur CORE_LANG */
    $paramVal = ApplicationParameterManager::getParameterValue('CORE', 'CORE_LANG');
    printf("CORE:CORE_LANG = '%s'\n", $paramVal);
    
    /* Paramètre non-utilisateur CORE_START_APP */
    $paramVal = ApplicationParameterManager::getParameterValue('CORE', 'CORE_START_APP');
    printf("CORE:CORE_START_APP = '%s'\n", $paramVal);

Sortie :

    CORE:CORE_LANG = 'fr_FR'
    CORE:CORE_START_APP = 'APP_SWITCHER'

## Notes {#core-ref:6431a41e-c1fa-40f8-af39-37a8ad4202d9}

*   L'argument `application` peut aussi être la constante
`ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
l'application courante) ou `ApplicationParameterManager::GLOBAL_PARAMETER` (pour
adresser des paramètres globaux).

## Voir aussi {#core-ref:46024efd-0ce3-4926-848a-f723ce796dab}

- [Valeur principale et valeur personnalisée][valeurPrincipaleEtValeurPersonnalisée]
- [`ApplicationParameterManager::getUserParameterValue`][getUserParameterValue]
- [`ApplicationParameterManager::getUserParameterDefaultValue`][getUserParameterDefaultValue]
- [`ApplicationParameterManager::getCommonParameterValue`][getCommonParameterValue]

<!-- links -->

[valeurPrincipaleEtValeurPersonnalisée]: #core-ref:41f3aeb5-01c3-4252-b3da-35b55932d4dd
[getUserParameterValue]: #core-ref:ad6d5849-bcdd-43d8-904b-61b0e9fea056
[getUserParameterDefaultValue]: #core-ref:d713087a-7e31-4559-bf5f-32fd829e88b5
[getCommonParameterValue]: #core-ref:2a259dc7-8fb2-4658-86c7-4375d97d941a