# ApplicationParameterManager::getParameters() {#core-ref:04a6216a-2c14-4bed-92d6-576a9574d30e}

<div markdown="1" class="short-description">
La méthode `getParameters()` permet de récupérer la définition de tous les
paramètres d'une application.
</div>

## Description {#core-ref:9b51b5cb-e420-44a6-893b-6d41b7b5481a}

    [php]
    array[] static getParameters ( mixed $application )

Retourne une liste de `array` contenant la définition des paramètres de
l'application.

### Avertissements {#core-ref:3adf22b6-0902-439f-a437-60848cbceb4a}

Aucun.

## Liste des paramètres {#core-ref:27a1353a-8735-466c-a5b3-57a8a1558d56}

(string|int|Application) `application`
:   Le nom, l'identifiant ou l'objet `Application` de l'application dont on
    souhaite avoir la définition de tous ses paramètres.

## Valeur de retour {#core-ref:d6ca8cd4-542d-4060-ad68-56d000a8c1b9}

Retourne une liste de `array` de définition de paramètres :

    array(
    	0 => array(
    		'name' => …,
    		…
    		),
    	1 => array(
    		'name' => …,
    		…
    		),
    	…
    )

Voir structure du `array()` de définition des paramètres dans
[valeur de retour][getParameter_retval] de [`getParameter()`][getParameter].

## Erreurs / Exceptions {#core-ref:06c75fea-821e-456a-abd5-49d0268b0ded}

Si l'application n'est pas trouvée ou si aucun paramètre n'est trouvé, une
exception `\Dcp\ApplicationParameterManager\Exception` est levée.

## Historique {#core-ref:5374a7bb-0bd4-47c6-aba9-08095d7f9a61}

Aucun.

## Exemples {#core-ref:0b0886fd-7a49-413e-9d00-95964d7d3734}

    [php]
    try {
        $paramDefList = ApplicationParameterManager::getParameters('CORE');
    } catch(\Dcp\ApplicationParameterManager\Exception $e) {
        printf("Application not found or no parameters found.");
        throw $e;
    }
    foreach ($paramDefList as $paramDef) {
        printf("name = '%s', isuser = '%s', kind = '%s'\n", $paramDef['name'], $paramDef['isuser'], $paramDef['kind']);
    }

Sortie :

    name = 'INIT', isuser = 'N', kind = 'text'
    name = 'CORE_LOGLEVEL', isuser = 'N', kind = 'text'
    name = 'VERSION', isuser = 'N', kind = 'static'
    …
    name = 'CORE_ALLOW_GUEST', isuser = 'N', kind = 'enum(yes|no)'
    name = 'CORE_MAILACTION', isuser = 'N', kind = 'text'
    name = 'CORE_LANG', isuser = 'Y', kind = 'enum(en_US|fr_FR)'

## Notes {#core-ref:5821c2c8-5f75-4286-9b99-fbc541e24aa6}

*   L'argument `application` peut aussi être la constante
    `ApplicationParameterManager::CURRENT_APPLICATION` (pour référencer
    l'application *courante*) ou `ApplicationParameterManager::GLOBAL_PARAMETER`
    (pour adresser des *paramètres globaux*).

## Voir aussi {#core-ref:4c33a391-24e9-41c7-b161-49295bfc962e}

- [`ApplicationParameterManager::getParamter()`][getParameter]

<!-- link -->
[getParameter]: #core-ref:40056f46-8947-4872-96ce-7ecade7be04f
[getParameter_retval]: #core-ref:9af55d6e-f958-4c20-b6e2-47bfd59c1fc0