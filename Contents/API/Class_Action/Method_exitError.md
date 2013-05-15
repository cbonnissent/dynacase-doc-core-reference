# Action::exitError {#core-ref:D6845AA2-FACC-41B5-82D1-4681FCE55783}

<div class="short-description">
Mettre fin à l'exécution d'une action avec un message d'erreur.
</div>

<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:5DDFBD76-CB4D-4AB5-9849-5BF9C90DA9A6}


    [php]
    void exitError ( string $texterr )

Permet de mettre fin à l'exécution de l'action et de remonter un message d'erreur à l'utilisateur.

- Si l'action est exécutée en mode Web (variable PHP `$_SERVER['HTTP_HOST']` non vide), alors une page HTML d'erreur est générée avec le message d'erreur donné en argument.
- Si l'action n'est pas exécutée en mode Web, une exception `Dcp\Core\Exception` est levée avec le message d'erreur donné en argument.

## Avertissements {#core-ref:EBE69C82-09F3-474A-82A6-32F4E5F10025}

N/A

## Liste des paramètres {#core-ref:DDE7A59F-4F32-415C-9C34-8D6A69A8F488}

(string) `texterr`
:   Le message d'erreur.

## Valeur de Retour {#core-ref:B3F54635-9009-4EA6-9394-E18ADF595CB6}

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions {#core-ref:909579B3-281E-4E80-9BFC-4748B8D7D6DF}

N/A

## Historique {#core-ref:7A747EED-CE9A-4554-B77B-F6716FA39BB2}

N/A

## Exemples {#core-ref:4252BB94-5C44-428A-8BAA-0F78056BC19C}

- Exemple #1


    [php]
    $errmsg = sprintf("Document with id '%d' does not exists.", $docId);
    $action->exitError($errmsg);

## Notes {#core-ref:F36C29BF-520A-428D-97C1-90E061BA27A7}

N/A

## Voir aussi {#core-ref:E671125D-DCDB-4349-B9E3-0648CD92B9A3}

N/A
