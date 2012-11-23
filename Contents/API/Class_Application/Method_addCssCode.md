# Application::addCssCode {#core-ref:5480ED21-5027-45C3-9EFE-3897784B8865}

<div class="short-description">
Ajouter du code CSS à un template.
</div>

<!-- <div class="applicability"></div> -->

## Description {#core-ref:08686C08-8A9E-4F28-A7BB-B4EB5DC39850}


    [php]
    void addCssCode ( string $code )

Permet d'ajouter des instructions CSS (`code`) qui seront insérées dans les éléments `[CSS:CODE]` des templates utilisées lors du rendu d'une vue.

## Avertissements {#core-ref:2BED3980-13BE-42B5-9380-A7C6896EF89C}

N/A

## Liste des paramètres {#core-ref:0253405E-3D82-4724-AD06-EB0D787DC51D}

(string) `code`
:   Bloc de code d'instructions CSS.

## Valeur de Retour {#core-ref:0B1EB3A8-638D-44E3-B0D3-60724F862145}

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions {#core-ref:CCC19B74-123A-4FA4-9E5A-72B136BDDA30}

N/A

## Historique {#core-ref:5D450B47-140B-4E43-9E73-EB1D4F5B5ECA}

N/A

## Exemples {#core-ref:D3C6EB9C-BE92-43C8-A144-C360D81FAA1B}

- Exemple #1

Contrôleur de l'action `MY_ACTION` (`my_action.php`) :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $cssCode = <<<'CSS'
    .question {
        color: blue;
        voice-family: Bridgekeeper, male;
    }
    CSS;

        $application->addCssCode($cssCode);
    }

Vue de l'action `MY_ACTION` (`Layout/my_action.xml`) :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
        <style type="text/css">
    [CSS:CODE]
        </style>
      </head>
      <body>
        <h1 class="question">What is your favourite colour?</h1>
      </body>
    </html>


Résultat du rendu de la vue de l'action :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
        <style type="text/css">
    .question {
        color: blue;
        voice-family: Bridgekeeper, male;
    }
        </style>
      </head>
      <body>
        <h1 class="question">What is your favourite colour?</h1>
      </body>
    </html>

## Notes {#core-ref:9F333924-790C-4332-88DA-CD2E7539FC90}

N/A

## Voir aussi {#core-ref:46F3A61E-2FF9-490A-8C9E-69F01DF5E823}

- [`Application::addCssRef`](#core-ref:4BBA8A6B-8002-4C0A-8AC7-70D75B31B02B)
- [`Application::getCSSLink`](#core-ref:7A7BE83F-FBC2-4F45-8115-BC295321BCF4)
