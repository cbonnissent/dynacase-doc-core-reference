# ApplicationParameterManager::setCommonParameterValue() {#core-ref:7182f311-efe5-4997-a043-b5a63c7e2e2b}

<div markdown="1" class="short-description">
La méthode `setCommonParameterValue()` permet d'écrire la valeur principale d'un
paramètre d'une application.
</div>

## Description {#core-ref:56676034-efa5-47ec-8e1e-55e184d55afa}

    [php]
    void setCommonParameterValue ( mixed $application,
                                  string $parameterName,
                                  string $value )

La valeur principale du paramètre `$parameterName` de l'application
`$application` est positionnée avec la valeur `$value` fournie.

### Avertissements {#core-ref:8509e6e0-e713-4e6e-87b6-47bb97c42592}

Aucun.

## Liste des paramètres {#core-ref:5403a84d-c36e-4e65-b206-f39612bf634c}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite écrire la valeur principale d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite écrire la valeur principale.

(string) `value`
:   La valeur à inscrire comme valeur principale pour ce paramètre.

## Valeur de retour {#core-ref:a55f4eaf-e681-450e-913d-ba33e215508e}

La méthode ne retourne rien.

## Erreurs / Exceptions {#core-ref:15326635-0fea-43d0-8d9c-59bcd7dffcfa}

Si le paramètre ou l'application n'existe pas alors une exception
(`\Dcp\ApplicationParameterManager\Exception`) est levée.

## Historique {#core-ref:b81905a7-3a0c-44b5-b54b-adc6373e7262}

Aucun.

## Exemples {#core-ref:d7bf79fc-3869-4307-92b6-b7a62a4839d7}

    [php]
    /* Affiche la valeur principale de CORE_LANG */
    printf("CORE:CORE_LANG principal value = '%s'\n", ApplicationParameterManager::getCommonParameterValue('CORE', 'CORE_LANG'));
    
    /* Positionne la valeur principale à 'en_US' */
    try {
        ApplicationParameterManager::setCommonParameterValue('CORE', 'CORE_LANG', 'en_US');
    } catch(\Dcp\ApplicationParameterManager\Exception $e) {
        printf("Error setting parameter's default value.");
        throw $e;
    }
    
    /* Affiche la valeur principale de CORE_LANG */
    printf("CORE:CORE_LANG principal value = '%s'\n", ApplicationParameterManager::getCommonParameterValue('CORE', 'CORE_LANG'));

Sortie :

    CORE:CORE_LANG principal value = 'fr_FR'
    CORE:CORE_LANG principal value = 'en_US'

## Notes {#core-ref:38111e4b-8d42-40fe-b6ef-bd172bf77e4e}

    *   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
    l'application *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER`
    (pour adresser des *paramètres globaux*).

## Voir aussi {#core-ref:10c4088c-083d-4c30-8088-a3c64cda8d3e}

Aucun.
