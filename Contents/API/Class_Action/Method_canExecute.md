# Action::canExecute {#core-ref:18d21adf-e583-4023-9d80-95de75f19eb0}

<div class="short-description">
Vérifier si l'utilisateur a le droit d'exécuter une action donnée.
</div>

<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:4bc7c264-411d-4260-ad20-014486184079}


    [php]
    string canExecute ( string $actname [, int $appid = ""] )

Permet de vérifier si l'utilisateur connecté a le droit d'exécuter une action
donnée.

## Avertissements {#core-ref:68b1ac3e-3e7f-4893-9b5f-44063dc791ae}

N/A

## Liste des paramètres {#core-ref:6c6f5601-bb52-4317-987b-553049bdad61}

(string) `actname`
:   Le nom de l'action dont on souhaite vérifier le droit d'exécution pour 
    l'utilisateur connecté.

(int) `appid`
:   Identifiant de l'application de l'action dont on souhaite vérifier le droit 
    d'exécution. Par défaut, l'application de l'objet `Action` est utilisée.

## Valeur de Retour {#core-ref:e9c0c1ea-e8e7-42c1-9601-d3d35071aba3}

Retourne une chaîne vide si l'utilisateur a le droit d'exécuter l'action donnée,
ou une chaîne non vide lorsque l'utilisateur n'a pas le droit d'exécuter
l'action donnée ou s'il y a une erreur dans la vérification du droit.

## Erreurs / Exceptions {#core-ref:333bd273-f6c6-407c-a543-c7c742870a82}

En cas d'erreur dans la vérification des droits (ex. application ou action non
existante), une chaîne non vide est retournée avec le message d'erreur
rencontré.

## Historique {#core-ref:6d1fbf0d-31be-41a5-bd2e-8dfb56e6e03c}

N/A

## Exemples {#core-ref:7a4009ca-523e-4a70-ba01-8b6810c05a9d}

- Exemple #1 Vérifier si l'utilisateur a le droit d'exécuter l'action 
`MY_ACTION` de l'application de l'action courante

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

- Exemple #2 Vérifier si l'utilisateur a le droit d'exécuter l'action 
`MY_ACTION` de l'application `MY_APP`


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

## Notes {#core-ref:543a6273-a063-4d2b-96fe-42809b798b37}

N/A

## Voir aussi {#core-ref:6e666681-c981-417e-8265-46424a8f2dcc}

N/A
