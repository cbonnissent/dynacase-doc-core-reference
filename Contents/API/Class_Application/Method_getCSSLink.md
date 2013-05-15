# Application::getCSSLink {#core-ref:7A7BE83F-FBC2-4F45-8115-BC295321BCF4}

<div class="short-description">
Récupérer le lien de téléchargement (URL) d'une feuille de style CSS.
</div>

<!-- <div class="applicability"></div> -->

## Description {#core-ref:E7994E66-C164-414F-8D03-6680F4C16AD3}


    [php]
    string getCSSLink ( string $ref [, bool $needparse = false [, string $packName = '']] )

Permet de retourner le lien de téléchargement (URL) d'une feuille de style CSS servie par Dynacase avec gestion de la version du cache (Voir [Notes](#core-ref:9C309FEA-C54A-48C3-AD9C-03F20D532D1D)).

## Avertissements {#core-ref:06FD2B30-72C3-4E44-8656-588EDFCAE2CA}

N/A

## Liste des paramètres {#core-ref:6469FDAD-A30E-4E74-A191-9C7392B3F56C}

(string) `ref`
:   La référence à la feuille de style CSS.
    
    La référence peut être : un chemin d'accès relatif au contexte Dynacase (ex. `MY_APP/Layout/my_css.css`, `my_css.css`), un chemin d'accès relatif au répertoire `Layout` du style 
     actuellement appliqué, un chemin d'accès relatif au répertoire `Layout` de l'application courante ou d'une application particulière (ex. `MY_APP:my_css.css`), une URL (ex. `http://www.example.net/my_css.css`).

(bool) `needparse`
:   Permet d'indiquer si le contenu de la feuille de style doit être interprété comme un template.

(string) `packName`
:   Les feuilles de style peuvent être concaténées afin de réduire le nombre de fichiers chargés par le client. Dans ce cas, toutes les feuilles de style ajoutées avec un même identifiant `packName` seront concaténées pour ne donner qu'un seul fichier à charger. Des `packName` différents peuvent être utilisés pour faire des groupes de feuilles de style qui seront servis chacun dans un fichier unique et distinct par `packName`.

## Valeur de Retour {#core-ref:8B51AF9C-CC86-4A76-A312-38BB27B1D737}

La méthode retourne une chaîne de caractère non vide avec le lien de téléchargement de la feuille de style CSS ajoutée, ou une chaîne de caractère vide si l'emplacement de la feuille de style n'est pas valide.

## Erreurs / Exceptions {#core-ref:F8FBEEC1-DB4A-4612-90E3-01FB3FEDC38D}

N/A

## Historique {#core-ref:DACABE14-A2FC-4641-A06A-5E356771DB03}

N/A

## Exemples {#core-ref:56CD86DA-97FA-4D24-8BC6-E1491883D5F5}

- Exemple #1

Feuille de style CSS `MY_APP/Layout/css_1.css` :


    [css]
    .question {
        color: blue;
        voice-family: Bridgekeeper, male;
    }

Contrôleur de l'action `MY_ACTION` (`my_action.php`) :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $cssLink = $application->getCSSLink('MY_APP/Layout/css_1.css');

        $action->lay->set('CSS_LINK', htmlspecialchars($cssLink));
    }

Vue de l'action `MY_ACTION` (`Layout/my_action.xml`) :


    [html]
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Action</title>
        <link rel="stylesheet" type="text/css" href="[CSS_LINK]" />
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
        <link rel="stylesheet" type="text/css" href="MY_APP/Layout/css_1.css?wv=4253" />
      </head>
      <body>
        <h1 class="question">What is your favourite colour?</h1>
      </body>
    </html>

## Notes {#core-ref:9C309FEA-C54A-48C3-AD9C-03F20D532D1D}

- Les feuilles de style ajoutées via cette méthode seront servies avec une directive indiquant au client de mettre en cache le résultat obtenu et minimiser ainsi les requêtes au serveur.
- L'expiration de la mise en cache est gérée via un argument `wv=<version>` dont le numéro de version est incrémenté à chaque mise à jour d'un module.
- Les `packName` sont composés par utilisateur et sont mis en cache sur le navigateur de l'utilisateur : ils ne sont donc pas partagés et/ou mis en cache sur le serveur.

## Voir aussi {#core-ref:C9BC22F8-4D83-4D16-AEFB-684B25F7CBC4}

- [`Application::addCssCode`](#core-ref:5480ED21-5027-45C3-9EFE-3897784B8865)
- [`Application::addCssRef`](#core-ref:4BBA8A6B-8002-4C0A-8AC7-70D75B31B02B)
