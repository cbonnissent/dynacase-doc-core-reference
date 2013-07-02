# ApplicationParameterManager::setParameterValue() {#core-ref:c5ea5a26-a359-4379-ab2b-0397dda62567}

<div markdown="1" class="short-description">
La méthode `setParameterValue()` permet d'écrire la valeur principale d'un
paramètre non-utilisateur, ou la valeur personnalisée d'un paramètre
utilisateur.
</div>

## Description {#core-ref:4477745a-55af-417d-a6c7-e4435d3bb77f}

    [php]
    voir static setParameterValue ( mixed $application,
    	                           string $parameterName,
    	                           string $value )

Si le paramètre est un paramètre utilisateur (`'user' => 'Y'`) alors c'est la
valeur personnalisée qui est écrite
([`setUserParameterValue`][setUserParameterValue]), sinon c'est la valeur
principale qui est écrite
([`setCommonParameterValue`][setCommonParameterValue]).

### Avertissements {#core-ref:2cb52141-9b40-416b-8a2f-bd1442d547ff}

Aucun.

## Liste des paramètres {#core-ref:cb5ce20e-b338-47b7-8f99-9a5b33329af1}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite écrire la valeur d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite écrire la valeur.

(string) `value`
:   La valeur à inscrire comme valeur pour ce paramètre.

## Valeur de retour {#core-ref:c40be5dc-bc88-489e-9550-f9620441c81b}

La méthode ne retourne rien.

## Erreurs / Exceptions {#core-ref:d7f9cc1c-2a2b-4ef3-843c-39ac99cc507c}

Aucune.

## Historique {#core-ref:8b13913a-7d0e-4c12-9728-ea8372c297ff}

Aucun.

## Exemples {#core-ref:fabe1524-a979-4238-8a6a-333d6af0ae35}

    [php]
    /* Écrit dans la valeur personnalisée car CORE_LANG est déclaré avec 'user' => 'Y' */
    ApplicationParameterManager::setParameterValue('CORE', 'CORE_LANG', 'en_US');
    
    /* Écrit dans la valeur principale car CORE_CLIENT est déclaré avec 'user' => 'N' */
    ApplicationParameterManager::setParameterValue('CORE', 'CORE_CLIENT', 'ACME Corp.');

## Notes {#core-ref:661c9d1e-7392-45b1-ab45-7609e369976f}

*   L'argument `application` peut aussi être la constante
`ApplicationParameterManager::CURRENT_APPLICATION` (pour l'application *
courante) ou `ApplicationParameterManager::GLOBAL_PARAMETER` pour adresser des *
paramètres globaux.

## Voir aussi {#core-ref:9b7d2319-abe9-422f-a245-d5c8bcc88767}

Aucun.

<!-- links -->
[setUserParameterValue]: #core-ref:174cdcd6-d465-4c4f-abd7-a0a9bca51f52
[setCommonParameterValue]: #core-ref:7182f311-efe5-4997-a043-b5a63c7e2e2b