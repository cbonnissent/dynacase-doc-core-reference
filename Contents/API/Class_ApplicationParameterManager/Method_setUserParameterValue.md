# ApplicationParameterManager::setUserParameterValue() {#core-ref:174cdcd6-d465-4c4f-abd7-a0a9bca51f52}

<div markdown="1" class="short-description">
La méthode `setUserParameterValue()` permet d'écrire la valeur personnalisée
d'un paramètre utilisateur d'une application.
</div>

## Description {#core-ref:4d249578-9e85-49a9-906d-e91807a309cc}

    [php]
    void static setUserParameterValue ( mixed $application,
                                       string $parameterName,
                                       string $value,
                                          int $userid = null
                                         bool $check = true )

### Avertissements {#core-ref:a88ff7da-d4bd-4a47-8ba9-e6c5835349ac}

Aucun.

## Liste des paramètres {#core-ref:c4280e64-9fd4-45d1-8b76-11d90c39ccad}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite écrire la valeur personnalisée d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite écrire la valeur personnalisée.

(string) `value`
:   La valeur à inscrire comme valeur personnalisée pour ce paramètre.

(int) `userId`
:   L'identifiant de l'utilisateur pour lequel on souhaite écrire la valeur
    personnalisée du paramètre. Si l'identifiant n'est pas spécifié (ou si
    `null` est spécifié), alors c'est l'identifiant de l'utilisateur
    actuellement connecté qui est utilisé.

(bool) `check`
:   Permet de vérifier (`true`) ou non (`false`) si le paramètre spécifié est
    bien un paramètre utilisateur.

## Valeur de retour {#core-ref:29ed97c3-8823-4090-90e1-8c1b5ee3a450}

La méthode ne retourne rien.

## Erreurs / Exceptions {#core-ref:edc15ec8-3d2c-42ef-be78-722fc9b6d3e5}

Si le paramètre n'existe pas, est incorrect, ou si le paramètre n'est pas un
paramètre utilisateur et que `check` est à  `true`, alors une exception
(`\Dcp\ApplicationParameterManager\Exception`) est levée.

## Historique {#core-ref:7109b8b6-69a7-4c62-a0b9-2e77f2bc6f57}

Aucun.

## Exemples {#core-ref:6b471d1b-b810-4759-9160-36ada101bae4}

    [php]
    /* Changer la langue par défaut de l'utilisateur courant epar 'en_US' */
    ApplicationParameterManager::setUserParameterValue('CORE', 'CORE_LANG', 'en_US');

## Notes {#core-ref:4eba9d15-0643-4295-8ec2-b3885cfc0409}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour l'application 
    *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER` pour adresser
    des *paramètres globaux*.

## Voir aussi {#core-ref:9be1b0d5-f1a1-4007-b9ed-262b0cba0214}

Aucun.
