# Action::getImageUrl()

<div class="short-description">
Cette méthode retourne l'url d'accès à une image stockée sur le serveur.
</div>
<!--
<div class="applicability">
Applicable
</div>
-->

## Description

    [php]
    string getImageUrl ( string $name [, bool $detectstyle = true [, int $size = null]] )

L'image demandée doit être une image fournie par l'application associée à l'action ou une autre application.




### Avertissements

N/A

## Liste des paramètres


(string) `name`
:   nom du fichier image (*basename*).

(bool) `detectstyle`
:   indique si la détection de style doit être pris en compte.
    
    valeur par défaut : **`true`**
   
    Si la détection de style est activée, l'image sera recherchée dans différents répertoires dans l'ordre suivant :

    1. L'image est recherchée dans le répertoire "*`Images`*" du répertoire du style *société* (nom provenant du paramètre application "*`CORE_SOCSTYLE`*"). 

    2. L'image est recherchée dans le répertoire du style utilisateur (paramètre applicatif "*`STYLE`*"). De même, l'image est recherchée dans le sous-répertoire "*Images*" du répertoire de style.

    3.  L'image est recherchée dans le sous-répertoire "*`Images`*" du répertoire d'installation de l'application associée à l'action instanciée.

    4. Si l'image n'est pas trouvée, elle est recherchée en dernier recourt dans le répertoire "*`Images`*" général du répertoire d'installation de Dynacase. Ce répertoire général d'images contient un lien vers toutes les images fournies par toutes les applications installées.

    Si la détection de style n'est pas activée, les recherches n°1 et n°2 ne sont pas effectuées.

(int) `size`
:   indique la largeur de l'image en pixel. 
    valeur par défaut :  **`null`** indique qu'aucun redimensionnement sera effectuée
    
    Si la valeur n'est pas renseignée la taille originale est conservée sinon une conversion d'image sera appliquée afin d'avoir la largeur indiquée.
    Cette conversion d'image est effectuée sur le serveur lors de la premier appel de l'url donnée. Ensuite le résultat de cette conversion d'image est mis en cache (répertoire `var/cache/images`) pour un accès plus rapide lors des prochains appels. Cette conversion retourne toujours une image au format *png*.



## Valeur de retour

L'url **relative** d'accès à l'image est retournée. Le résultat de cette fonction peut être mise dans le layout d'une action qui permet de référence des url relatives. Pour avoir une url absolue, il faut ajouter le paramètre "*CORE_EXTERNURL*" pour compléter l'url.

Si l'image n'est pas trouvée, c'est l'image définie dans l'attribut "*noimage*" de la classe Application qui est retournée. Cette image est 'CORE/Images/noimage.png' :
![image non trouvée](images/noimage.png "No image")

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

    [php]
    // myaction.php
    function myAction(Action &$action) {
      $imageUrl=$action->getImageUrl('myImage.png'); // image originale
      $smallImageUrl=$action->getImageUrl('myImage.png',true, 20); // 20 pixels de largeur
      // constitution d'une URL absolue
      $absoluteUrl=$action->getParam("CORE_EXTERNURL").$imageUrl;
   }


## Notes

Bien que cette méthode soit définie sur la classe `Action`, elle est un raccourci pour accéder à la méthode Application::getImageUrl de l'application dont est issu l'action.

## Voir aussi

N/A
