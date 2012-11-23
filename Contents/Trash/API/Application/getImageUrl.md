# Application::getImageUrl

<div class="short-description">
Récupérer le lien de téléchargement (URL) d'une image.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    string getImageUrl ( string $img [, bool $detectstyle = true [, int $size = null]] )

La méthode `getImageUrl` de l'objet `Application` permet de retourner le lien de téléchargement (URL) d'une image servie par Dynacase avec la gestion de mise à l'échelle.

## Avertissements

N/A

## Liste des paramètres

(string) `img`
:   Le nom de l'image.
    
    Le nom de l'image est recherché dans les répertoires et dans l'ordre suivants : dans le répertoire `Images` du `STYLE` courant (si `detectstyle` est à `true`), dans le répertoire `Images` de l'application courante, dans le répertoire `Images` de l'application parente, dans le répertoire `Images` présent à la racine du contexte.

(bool) `detectstyle`
:   Permet d'indiquer si l'image doit être recherchée en priorité dans le `STYLE` courant.

(int) `size`
:   Permet de servir l'image avec une mise à l'échelle dynamique à la dimension `size` x `size`.

## Valeur de Retour

La méthode retourne une chaîne de caractère avec le lien de téléchargement de l'image, ou le lien vers l'image générique `CORE/Images/noimage.png` si l'image n'est pas trouvée.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1

Soit une image `img.png` dans le répertoire `Images` de l'application `MY_APP`.

Contrôleur de l'action `MY_ACTION` de l'application `MY_APP` (`my_action.php`) :


    [php]
    function my_action(Action &$action) {
        /* Get the Application of the current Action */
        $application = $action->parent;

        $imgSize = 256;
        $imgUrl = $application->getImageUrl('img.png', false, $imgSize);

        $action->lay->set('IMG_SIZE', $imgSize);
        $action->lay->set('IMG_LINK', $imgUrl);
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
        <img src="[IMG_LINK]" width="[IMG_SIZE]" height="[IMG_SIZE]" />
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
        <img src="resizeimg.php?img=MY_APP/Images/img.png&size=256" width="256" height="256" />
      </body>
    </html>

## Notes

N/A

## Voir aussi

N/A
