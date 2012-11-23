# Application::addJsRef {#core-ref:B4B041AA-2649-498D-ACE7-52131053C7DB}

<div class="short-description">
Ajouter un lien vers un script Javascript à un template.
</div>

<!-- <div class="applicability"></div> -->

## Description {#core-ref:B72C0289-774F-4BB9-8BC6-25C89216BF87}


    [php]
    string addJsRef ( string $ref [, bool $needparse = false [, string packName = '']] )

Permet d'ajouter un lien vers un script JavaScript qui sera inséré dans les éléments `[JS:REF]` des templates utilisées lors du rendu d'une vue.

## Avertissements {#core-ref:77BA2E0E-2D54-4C7F-9F7B-3286C1FC9883}

N/A

## Liste des paramètres {#core-ref:52E58F18-54FD-41EC-99B7-EB736DAC7BA2}

(string) `ref`
:   La référence au script JavaScript.
    
    La référence peut être : un chemin d'accès relatif au contexte Dynacase (ex. `MY_APP/Layout/my_script.js`, `my_script.js`), un chemin d'accès relatif au répertoire `Layout` du style actuellement appliqué, un chemin d'accès relatif au répertoire `Layout` de l'application courante ou d'une application particulière (ex. `MY_APP:my_script.js`), une URL (ex. `http://www.example.net/my_script.js`).

(bool) `needparse`
:   Permet d'indiquer si le contenu du script doit être interprété comme un template.

(string) `packName`
:   Les scripts peuvent être concaténés afin de réduire le nombre de fichiers chargés par le client. Dans ce cas, tous les scripts ajoutés avec un même identifiant `packName` seront concaténés pour ne donner qu'un seul fichier à charger. Des `packName` différents peuvent être utilisés pour faire des scripts qui seront servis chacun dans un fichier unique et distinct par `packName`.

## Valeur de Retour {#core-ref:5E557C4D-F9E7-496D-96AE-8AB287B070EB}

La méthode retourne une chaîne de caractère non vide avec l'emplacement du script JavaScript ajouté, ou une chaîne de caractère vide si l'emplacement du script n'est pas valide.

## Erreurs / Exceptions {#core-ref:5C1F9F56-615A-4E6E-A17C-AC43B40CE293}

N/A

## Historique {#core-ref:67BDDEF5-2B08-4C06-A75F-A4583BCB77E6}

N/A

## Exemples {#core-ref:C46F66EC-69D7-4F1E-9D2B-47782FB48A2E}

- Exemple #1

Script JavaScript `MY_APP/Layout/js_1.js` :


    [javascript]
    alert('This is JS#1');

Script JavaScript `MY_APP/Layout/js_2.js` :


    [javascript]
    alert('This is JS#2');

Contrôleur de l'action `MY_ACTION` (`my_action.php`) de l'application `MY_APP` :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $application->addJsRef('MY_APP/Layout/js_1.js', false, 'my_js');
        $application->addJsRef('MY_APP:js_2.js', false, 'my_js');
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
        [JS:REF]
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
        <script type="text/javascript" language="JavaScript" src="pack.php?type=js&pack=my_js&wv=4253" /></script>
        <h1>Have you seen any alert lately?</h1>
      </body>
    </html>

## Notes {#core-ref:70208A8E-D4EE-42DC-8626-CA2CBDA0933F}

- Les scripts ajoutées via cette méthode seront servis avec une directive indiquant au client de mettre en cache le résultat obtenu et minimiser ainsi les requêtes au serveur.
- L'expiration de la mise en cache est gérée via un argument `wv=<version>` dont le numéro de version est incrémenté à chaque mise à jour d'un module.
- Les `packName` sont composés par utilisateur et sont mis en cache sur le navigateur de l'utilisateur : ils ne sont donc pas partagés et/ou mis en cache sur le serveur.

## Voir aussi {#core-ref:B925E618-7DC9-4FA5-AB65-3E7B556BEFA0}

- [`Application::addJsCode`](#core-ref:49A8E28B-F286-45D7-B9E0-CC3591A8EFDE)
- [`Application::getJSLink`](#core-ref:95056B5D-5002-4A5D-BC26-31595FAD9AFD)
