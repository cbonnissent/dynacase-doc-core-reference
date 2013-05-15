# Application::addCssRef {#core-ref:4BBA8A6B-8002-4C0A-8AC7-70D75B31B02B}

<div class="short-description">
Ajouter un lien vers une feuille de style CSS à un template.
</div>

<!-- <div class="applicability"></div> -->

## Description {#core-ref:03C18EDE-A3BE-4518-ADBD-265B2EA74DA7}


    [php]
    string addCssRef ( string $ref [, bool $needparse = false [, string $packName = '']] )

Permet d'ajouter un lien vers une feuille de style CSS qui sera insérée dans les éléments `[CSS:REF]` des templates utilisées lors du rendu d'une vue.

## Avertissements {#core-ref:22003ACD-A383-4C2C-928A-3BA9F8E53B88}

N/A

## Liste des paramètres {#core-ref:B6D1170A-DB84-4AB1-8B18-504BD4B445B0}

(string) `ref`
:   La référence à la feuille de style CSS.
    
    La référence peut être : un chemin d'accès relatif au contexte Dynacase (ex. `MY_APP/Layout/my_css.css`, `my_css.css`), un chemin d'accès relatif au répertoire `Layout` du style actuellement appliqué, un chemin d'accès relatif au répertoire `Layout` de l'application courante ou d'une application particulière (ex. `MY_APP:my_css.css`), une URL (ex. `http://www.example.net/my_css.css`).

(bool) `needparse`
:   Permet d'indiquer si le contenu de la feuille de style doit être interprété comme un template.

(string) `packName`
:   Les feuilles de style peuvent être concaténées afin de réduire le nombre de fichiers chargés par le client. Dans ce cas, toutes les feuilles de style ajoutées avec un même identifiant `packName` seront concaténées pour ne donner qu'un seul fichier à charger. Des `packName` différents peuvent être utilisés pour faire des groupes de feuilles de style qui seront servis chacun dans un fichier unique et distinct par `packName`.

## Valeur de Retour {#core-ref:27DBD4DD-485D-4F2E-ABCD-AB0AC66D73C6}

La méthode retourne une chaîne de caractères non vide avec l'emplacement de la feuille de style CSS ajoutée, ou une chaîne de caractères vide si l'emplacement de la feuille de style n'est pas valide.

## Erreurs / Exceptions {#core-ref:41788C64-AA2B-4F2F-9470-46C6CD24FE04}

N/A

## Historique {#core-ref:AC4C2011-7104-4BFF-9938-571A44BBEFF1}

N/A

## Exemples {#core-ref:70B7105C-4A8D-4C6A-A23E-ECF3B44D285C}

- Exemple #1

Feuille de style CSS `MY_APP/Layout/css_1.css` :


    [css]
    .question {
        color: blue;
    }

Feuille de style CSS `MY_APP/Layout/css_2.css` :


    [css]
    .question {
        voice-family: Bridgekeeper, male;
    }

Contrôleur de l'action `MY_ACTION` (`my_action.php`) de l'application `MY_APP` :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $application->addCssRef('MY_APP/Layout/css_1.css', false, 'my_css');
        $application->addCssRef('MY_APP:css_2.css', false, 'my_css');
    }

Vue de l'action `MY_ACTION` (`Layout/my_action.xml`) :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
        [CSS:REF]
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
        <link rel="stylesheet" type="text/css" href="pack.php?type=css&pack=my_css&wv=4253" />
      </head>
      <body>
        <h1 class="question">What is your favourite colour?</h1>
      </body>
    </html>

## Notes {#core-ref:72360E3F-5350-4A2F-A6A7-6EBBD2E80125}

- Les feuilles de style ajoutées via cette méthode seront servies avec une directive indiquant au client de mettre en cache le résultat obtenu et minimiser ainsi les requêtes au serveur.
- L'expiration de la mise en cache est gérée via un argument `wv=<version>` dont le numéro de version est incrémenté à chaque mise à jour d'un module.
- Les `packName` sont composés par utilisateur et sont mis en cache sur le navigateur de l'utilisateur : ils ne sont donc pas partagés et/ou mis en cache sur le serveur.

## Voir aussi {#core-ref:0F8F1E52-37FB-4C9E-9C71-051B98FFEAC2}

- [`Application::addCssCode`](#core-ref:5480ED21-5027-45C3-9EFE-3897784B8865)
- [`Application::getCSSLink`](#core-ref:7A7BE83F-FBC2-4F45-8115-BC295321BCF4)
