# ApplicationParameterManager::getParameter() {#core-ref:40056f46-8947-4872-96ce-7ecade7be04f}

<div markdown="1" class="short-description">
La méthode `getParameter()` permet de récupérer la définition d'un paramètre.
</div>

## Description {#core-ref:0b73573f-6147-4556-8b4a-ccbd3be74b66}

    [php]
    array static getParameter ( mixed $application,
                               string $parameterName )

Retourne un `array` contenant les propriétés de la définition du paramètre de
l'application.

### Avertissements {#core-ref:1c4635dd-6a9c-43d5-b443-938cb002dab0}

Cette méthode retourne la définition du paramètre et non la valeur (principale
ou personnalisée) de celui-ci.

## Liste des paramètres {#core-ref:69ba4d5e-50cd-49fe-b91f-d5db2dcbea2d}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la définition d'un de ses paramètres.

(string) `parameterName`
:   Le nom du paramètre dont on souhaite avoir la définition.

## Valeur de retour {#core-ref:9af55d6e-f958-4c20-b6e2-47bfd59c1fc0}

Retourne un `array` contenant les propriétés de la définition du paramètre.

    array(
    	'name'    => $paramName,        /* Nom du paramètre */
    	'isuser'  => 'Y' | 'N',         /* Paramètre personnalisable ? */
    	'isstyle' => 'Y' | 'N',         /* Paramètre de style ? */
    	'isglob'  => 'Y' | 'N',         /* Paramètre global ? */
    	'appid'   => $applicationId,    /* Id de l'application */
    	'desc'    => $paramDescription, /* Description du paramètre */
    	'kind'    => $paramKind         /* Type du paramètre */
    )

## Erreurs / Exceptions {#core-ref:5f4deb03-0d0a-4b8a-979c-36d4340a57d8}

Si le paramètre ou l'application spécifié n'est pas trouvé, alors une exception
`\Dcp\ApplicationParameterManager\Exception` est levée.

## Historique {#core-ref:ccccb375-2e93-431a-a57a-be452584642b}

Aucun.

## Exemples {#core-ref:bf70855d-d7b6-43d5-9566-dbacafce7441}

    [php]
    try {
        $paramDef = ApplicationParameterManager::getParameter('CORE', 'CORE_LANG');
    } catch (\Dcp\ApplicationParameterManager\Exception $e) {
        printf("Parameter or application not found.\n");
        throw $e;
    }
    var_export($paramDef);

Sortie :

    $ ./wsh.php --api=test
    array (
      'name' => 'CORE_LANG',
      'isuser' => 'Y',
      'isstyle' => 'N',
      'isglob' => 'Y',
      'appid' => '1',
      'descr' => 'language',
      'kind' => 'enum(en_US|fr_FR)',
    )

## Notes {#core-ref:d91f15b4-c044-414d-a98e-a578759a8cc8}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
    l'application *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER`
    (pour adresser des *paramètres globaux*).

## Voir aussi {#core-ref:899a3db7-1b18-406d-9508-48d113717e5e}

Aucun.
