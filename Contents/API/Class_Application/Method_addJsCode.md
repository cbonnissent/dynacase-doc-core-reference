# Application::addJsCode {#core-ref:49A8E28B-F286-45D7-B9E0-CC3591A8EFDE}

<div class="short-description">
Ajouter du code Javascript à un template.
</div>

<!-- <div class="applicability"></div> -->

## Description {#core-ref:F066FF5A-F356-4B92-AF63-B9F98565D924}


    [php]
    void addJsCode ( string $code )

Permet d'ajouter des instructions JavaScript (`code`) qui seront insérées dans les éléments `[JS:CODE]` des templates utilisées lors du rendu d'une vue.

## Avertissements {#core-ref:307520C6-C9B7-4089-9716-DA6FABED51B3}

N/A

## Liste des paramètres {#core-ref:47953186-B7E2-4921-802A-CF62848B5559}

(string) `code`
:   Bloc de code d'instructions JavaScript.

## Valeur de Retour {#core-ref:91BE3731-622F-43C3-957B-782353211240}

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions {#core-ref:E035DD1D-79A7-4E1B-AA36-00E54A726443}

N/A

## Historique {#core-ref:AF32718C-8FC7-43DB-AE5B-A73C158447FC}

N/A

## Exemples {#core-ref:2D4BE354-A439-428E-AC7E-6A4B6D5D6E1A}

- Exemple #1

Contrôleur de l'action `MY_ACTION` (`my_action.php`) :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $jsCode = <<<'JS'
    alert('Hello world');
    JS;

        $application->addJsCode($jsCode);
    }

Vue de l'action `MY_ACTION` (`Layout/my_action.xml`) :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
      </head>
      <body>
        <script type="text/javascript">
    [JS:CODE]
        </script>
        <h1>Have you seen any alert lately?</h1>
      </body>
    </html>


Résultat du rendu de la vue de l'action :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
      </head>
      <body>
        <script type="text/javascript" language="JavaScript">
    alert('Hello world');
        </script>
        <h1>Have you seen any alert lately?</h1>
      </body>
    </html>

## Notes {#core-ref:548BFB05-6BDD-49D2-96AF-5729CEFBD06E}

N/A

## Voir aussi {#core-ref:CA7BA655-2CA2-4AEC-ADB5-6916C7382F32}

- [`Application::addJsRef`](#core-ref:B4B041AA-2649-498D-ACE7-52131053C7DB)
- [`Application::getJSLink`](#core-ref:95056B5D-5002-4A5D-BC26-31595FAD9AFD)
