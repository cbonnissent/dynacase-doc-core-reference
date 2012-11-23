# Action::canExecute {#core-ref:18D21ADF-E583-4023-9D80-95DE75F19EB0}

<div class="short-description">
Vérifier si l'utilisateur a le droit d'exécuter une action donnée.
</div>

<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:4BC7C264-411D-4260-AD20-014486184079}


    [php]
    string canExecute ( string $actname [, int $appid = ""] )

Permet de vérifier si l'utilisateur connecté a le droit d'exécuter une action donnée.

## Avertissements {#core-ref:68B1AC3E-3E7F-4893-9B5F-44063DC791AE}

N/A

## Liste des paramètres {#core-ref:6C6F5601-BB52-4317-987B-553049BDAD61}

(string) `actname`
:   Le nom de l'action dont on souhaite vérifier le droit d'exécution pour l'utilisateur connecté.

(int) `appid`
:   Identifiant de l'application de l'action dont on souhaite vérifier le droit d'exécution. Par défaut, l'application de l'objet `Action` est utilisée.

## Valeur de Retour {#core-ref:E9C0C1EA-E8E7-42C1-9601-D3D35071ABA3}

Retourne une chaîne vide si l'utilisateur a le droit d'exécuter l'action donnée, ou une chaîne non vide lorsque l'utilisateur n'a pas le droit d'exécuter l'action donnée ou s'il y a une erreur dans la vérification du droit.

## Erreurs / Exceptions {#core-ref:333BD273-F6C6-407C-A543-C7C742870A82}

En cas d'erreur dans la vérification des droits (ex. application ou action non existante), une chaîne non vide est retournée avec le message d'erreur rencontré.

## Historique {#core-ref:6D1FBF0D-31BE-41A5-BD2E-8DFB56E6E03C}

N/A

## Exemples {#core-ref:7A4009CA-523E-4A70-BA01-8B6810C05A9D}

- Exemple #1 Vérifier si l'utilisateur a le droit d'exécuter l'action `MY_ACTION` de l'application de l'action courante


    [php]
    $err = $action->canExecute('MY_ACTION');
    if ($err != '') {
        /*
         * User is not allowed to execute MY_ACTION,
         * or MY_ACTION does not exists
         */
        [...]
    }
    /*
     * User is allowed to execute MY_ACTION
     */
    [...]

- Exemple #2 Vérifier si l'utilisateur a le droit d'exécuter l'action `MY_ACTION` de l'application `MY_APP`


    [php]
    $null = null;
    
    $application = new \Application();
    $err = $application->set('MY_APP', $null);
    if ($err != '') {
        throw new Exception(sprintf("Could not find application with name 'MY_APP': %s", $err));
    }
    
    $err = $action->canExecute('MY_ACTION', $application->id);
    if ($err != '') {
        /*
         * User is not allowed to execute MY_ACTION from MY_APP,
         * or MY_ACTION from MY_APP does not exists
         */
        [...]
    }
    /*
     * User is allowed to execute MY_ACTION from MY_APP
     */
    [...]

## Notes {#core-ref:543A6273-A063-4D2B-96FE-42809B798B37}

N/A

## Voir aussi {#core-ref:6E666681-C981-417E-8265-46424A8F2DCC}

N/A
