# Action::exitError {#core-ref:d6845aa2-facc-41b5-82d1-4681fce55783}

<div class="short-description">
Mettre fin à l'exécution d'une action avec un message d'erreur.
</div>

<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:5ddfbd76-cb4d-4ab5-9849-5bf9c90da9a6}


    [php]
    void exitError ( string $texterr )

Permet de mettre fin à l'exécution de l'action et de remonter un message d'erreur à l'utilisateur.

- Si l'action est exécutée en mode Web (variable PHP `$_SERVER['HTTP_HOST']` non vide), alors une page HTML d'erreur est générée avec le message d'erreur donné en argument.
- Si l'action n'est pas exécutée en mode Web, une exception `Dcp\Core\Exception` est levée avec le message d'erreur donné en argument.

## Avertissements {#core-ref:ebe69c82-09f3-474a-82a6-32f4e5f10025}

N/A

## Liste des paramètres {#core-ref:dde7a59f-4f32-415c-9c34-8d6a69a8f488}

(string) `texterr`
:   Le message d'erreur.

## Valeur de Retour {#core-ref:b3f54635-9009-4ea6-9394-e18adf595cb6}

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions {#core-ref:909579b3-281e-4e80-9bfc-4748b8d7d6df}

N/A

## Historique {#core-ref:7a747eed-ce9a-4554-b77b-f6716fa39bb2}

N/A

## Exemples {#core-ref:4252bb94-5c44-428a-8baa-0f78056bc19c}

- Exemple #1


    [php]
    $errmsg = sprintf("Document with id '%d' does not exists.", $docId);
    $action->exitError($errmsg);

## Notes {#core-ref:f36c29bf-520a-428d-97c1-90e061ba27a7}

N/A

## Voir aussi {#core-ref:e671125d-dcdb-4349-b9e3-0648cd92b9a3}

N/A
