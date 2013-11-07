# Représentations textuelles  {#core-ref:7171835a-9f57-45a2-ab44-9ff76596ee1e}

Ce chapitre aborde les techniques avancées des représentations textuelles.

## Répétable à plusieurs niveaux {#core-ref:f7887006-d4eb-4f4a-a8f6-e8b89be2253c}

Les répétables à multi-niveaux permettent de construire des représentations qui
nécessitent des listes d'éléments de profondeur variable.

Pour mettre en pratique cette fonctionnalité, nous allons prendre un exemple : 
la réalisation d'une table de multiplication.

Le résultat suivant doit être obtenu :

    Table de multiplications
    --------------------------------------------
      x|  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ============================================
      1)  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ---+---+---+---+---+---+---+---+---+---+---+
      2)  2|  4|  6|  8| 10| 12| 14| 16| 18| 20|
    ---+---+---+---+---+---+---+---+---+---+---+
      3)  3|  6|  9| 12| 15| 18| 21| 24| 27| 30|
    ---+---+---+---+---+---+---+---+---+---+---+
      4)  4|  8| 12| 16| 20| 24| 28| 32| 36| 40|
    ---+---+---+---+---+---+---+---+---+---+---+
      5)  5| 10| 15| 20| 25| 30| 35| 40| 45| 50|
    ---+---+---+---+---+---+---+---+---+---+---+
      6)  6| 12| 18| 24| 30| 36| 42| 48| 54| 60|
    ---+---+---+---+---+---+---+---+---+---+---+
      7)  7| 14| 21| 28| 35| 42| 49| 56| 63| 70|
    ---+---+---+---+---+---+---+---+---+---+---+
      8)  8| 16| 24| 32| 40| 48| 56| 64| 72| 80|
    ---+---+---+---+---+---+---+---+---+---+---+
      9)  9| 18| 27| 36| 45| 54| 63| 72| 81| 90|
    ---+---+---+---+---+---+---+---+---+---+---+
     10) 10| 20| 30| 40| 50| 60| 70| 80| 90|100|
    ---+---+---+---+---+---+---+---+---+---+---+


Le système de template peut être utilisé dans diverses parties de Dynacase
(document, script, action, fichier php tiers, etc.). Ce système utilise la
[classe `Layout`][classlayout].

L'exemple ci-dessous fonctionne dans une [action][action] :

    [php]
    <?php
    function multiplication(Action & $action)
    {
        $usage = new ActionUsage($action);
        
        $max = $usage->addOption("max", "max", array() , 10);
        
        $lines = array(); // tableau pour le contenu
        $firstLine = array(); // tableau pour l'entête (premiere ligne)
        for ($i = 1; $i <= $max; $i++) {
            // construction l'entete du tableau (liste des chiffres)
            $firstLine[] = array(
                "X" => sprintf("%3d", $i)
            );
            // construction du corps du tableau
            $lines[] = array(
                "CURRENT_LINE_NUMBER" => "$i",
                "CURRENT_LINE_NUMBER_FIRST_COL" => sprintf("%3d", $i)
            );
            $currentLine = array(); // nouvelle ligne de resultat
            for ($j = 1; $j <= $max; $j++) {
                $currentLine[] = array(
                    "RESULT" => sprintf("%3d", $i * $j)
                );
            }
            //enregistrement de la nouvelle ligne avec le meme nom que celui d'appel dans le template
            $action->lay->setBlockData("LINE_$i", $currentLine);
        }
        $action->lay->setBlockData("LINES", $lines);
        $action->lay->setBlockData("FIRST_LINE", $firstLine);
        
        header('Content-Type: text/plain');
    }

Le code ci-dessus met en place les blocs suivants :

* `FIRST_LINE` : un bloc pour la première ligne, celui-ci contient les numéros 
de 1 à `$max` (le maximum),
* `LINES` : un bloc qui contient la liste des lignes, celui-ci contient la 
référence à la ligne en cours et le numéro de la ligne,
* `LINE_$i` : un bloc qui contient le contenu de chaque ligne, celui-ci contient
les résultats pour chaque ligne et est enregistré avec une clef permettant au 
contenu du bloc `LINES` de l'appeler.

    Table de multiplications
    ----[BLOCK FIRST_LINE]----[ENDBLOCK FIRST_LINE]
      x|[BLOCK FIRST_LINE][X]|[ENDBLOCK FIRST_LINE]
    ====[BLOCK FIRST_LINE]====[ENDBLOCK FIRST_LINE]
    [BLOCK LINES][CURRENT_LINE_NUMBER_FIRST_COL])[BLOCK LINE_[CURRENT_LINE_NUMBER]][RESULT]|[ENDBLOCK LINE_[CURRENT_LINE_NUMBER]]
    ---+[BLOCK LINE_[CURRENT_LINE_NUMBER]]---+[ENDBLOCK LINE_[CURRENT_LINE_NUMBER]]
    [ENDBLOCK LINES]

Le template ci-dessus contient les éléments suivants :

* une première ligne de présentation qui duplique autant de fois que nécessaire
le pattern `----`,
* une seconde ligne qui présente les numéros de 1 à `$max` (le maximum) séparés 
par `|`,
* une troisième ligne de présentation qui duplique autant de fois que nécessaire
le pattern `====`,
* un bloc `LINES` qui va dupliquer autant de fois que nécessaire les résultats,
ce bloc appel un bloc `LINE_[CURRENT_LINE_NUMBER]` qui contient le résultat, il 
produit en outre une ligne de présentation qui duplique autant de fois que 
nécessaire le pattern `---+`.

Lorsqu'on appelle l'action soit :

* en http : `?app=[APP_NAME]&action=[ACTION_NAME]&max=10`,
* en cli :  `./wsh.php --app=[APP_NAME] --action=[ACTION_NAME] --max=10`.

Le résultat obtenu est le suivant :

    Table de multiplications
    --------------------------------------------
      x|  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ============================================
      1)  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ---+---+---+---+---+---+---+---+---+---+---+
      2)  2|  4|  6|  8| 10| 12| 14| 16| 18| 20|
    ---+---+---+---+---+---+---+---+---+---+---+
      3)  3|  6|  9| 12| 15| 18| 21| 24| 27| 30|
    ---+---+---+---+---+---+---+---+---+---+---+
      4)  4|  8| 12| 16| 20| 24| 28| 32| 36| 40|
    ---+---+---+---+---+---+---+---+---+---+---+
      5)  5| 10| 15| 20| 25| 30| 35| 40| 45| 50|
    ---+---+---+---+---+---+---+---+---+---+---+
      6)  6| 12| 18| 24| 30| 36| 42| 48| 54| 60|
    ---+---+---+---+---+---+---+---+---+---+---+
      7)  7| 14| 21| 28| 35| 42| 49| 56| 63| 70|
    ---+---+---+---+---+---+---+---+---+---+---+
      8)  8| 16| 24| 32| 40| 48| 56| 64| 72| 80|
    ---+---+---+---+---+---+---+---+---+---+---+
      9)  9| 18| 27| 36| 45| 54| 63| 72| 81| 90|
    ---+---+---+---+---+---+---+---+---+---+---+
     10) 10| 20| 30| 40| 50| 60| 70| 80| 90|100|
    ---+---+---+---+---+---+---+---+---+---+---+

## Zone applicatives {#core-ref:2cd69ba4-601c-407d-ad5c-fc917bbbce02}

Ce chapitre aborde la construction de zones applicatives. Cette
mécanique est notamment utilisée pour pouvoir mutualiser un élément d'interface
entre différentes parties d'une application. Il est à noter que cet élément est
très proche des [zones documentaires][zone_documentaire].

Pour créer une zone, il faut deux éléments :

* un template obligatoire, celui-ci doit être dans le sous répertoire `Layout` 
de l'action et porter le même nom que celui de la zone avec l'extension `xml`,
* un contrôleur, celui-ci doit être contenu dans un fichier `php` qui porte le 
même nom que la zone et que la fonction.

*Note* : La casse et le format des fichiers sont similaires aux 
[zones documentaires][zone_documentaire].

Il est de plus possible de passer des paramètres aux zones, veuillez consulter le
chapitre des [zones documentaires][zone_documentaire] pour plus d'informations
sur ce point.

L'exemple que l'on va prendre consiste à injecter un entête sur toutes les pages,
cet entête contient le nom du client et la date du jour.

Soit les fichiers suivants :

`APP/header.php`

    [php]
    <?php
    
    function begin(Action $action) {
        $date = date("D, d M Y H:i:s");
        $action->lay->set("DATE",$date);
    }

`APP/Layout/header.xml`

    Cogip ([DATE])

Dans le template de l'action, la zone est appelée de la manière suivante

    [ZONE APP:HEADER]

La zone est inclue dans le template précédent :

    [ZONE APP:HEADER]
    Table de multiplications
    ----[BLOCK FIRST_LINE]----[ENDBLOCK FIRST_LINE]
      x|[BLOCK FIRST_LINE][X]|[ENDBLOCK FIRST_LINE]
    ====[BLOCK FIRST_LINE]====[ENDBLOCK FIRST_LINE]
    [BLOCK LINES][CURRENT_LINE_NUMBER_FIRST_COL])[BLOCK LINE_[CURRENT_LINE_NUMBER]][RESULT]|[ENDBLOCK LINE_[CURRENT_LINE_NUMBER]]
    ---+[BLOCK LINE_[CURRENT_LINE_NUMBER]]---+[ENDBLOCK LINE_[CURRENT_LINE_NUMBER]]
    [ENDBLOCK LINES]

Voici le résultat obtenu :

    Cogip (Mon, 04 Nov 2013 12:49:00)
    
    Table de multiplications
    --------------------------------------------
      x|  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ============================================
      1)  1|  2|  3|  4|  5|  6|  7|  8|  9| 10|
    ---+---+---+---+---+---+---+---+---+---+---+
      2)  2|  4|  6|  8| 10| 12| 14| 16| 18| 20|
    ---+---+---+---+---+---+---+---+---+---+---+
      3)  3|  6|  9| 12| 15| 18| 21| 24| 27| 30|
    ---+---+---+---+---+---+---+---+---+---+---+
      4)  4|  8| 12| 16| 20| 24| 28| 32| 36| 40|
    ---+---+---+---+---+---+---+---+---+---+---+
      5)  5| 10| 15| 20| 25| 30| 35| 40| 45| 50|
    ---+---+---+---+---+---+---+---+---+---+---+
      6)  6| 12| 18| 24| 30| 36| 42| 48| 54| 60|
    ---+---+---+---+---+---+---+---+---+---+---+
      7)  7| 14| 21| 28| 35| 42| 49| 56| 63| 70|
    ---+---+---+---+---+---+---+---+---+---+---+
      8)  8| 16| 24| 32| 40| 48| 56| 64| 72| 80|
    ---+---+---+---+---+---+---+---+---+---+---+
      9)  9| 18| 27| 36| 45| 54| 63| 72| 81| 90|
    ---+---+---+---+---+---+---+---+---+---+---+
     10) 10| 20| 30| 40| 50| 60| 70| 80| 90|100|
    ---+---+---+---+---+---+---+---+---+---+---+

*Note :* Il est possible d'appeler des zones dans des zones ce qui permet de 
composer des interfaces complexes.

<!-- link -->
[zone_documentaire]:    #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e
[classlayout]:          #core-ref:9f9edc1b-17a5-4f54-86ee-69e33016fe18
[action]:               #core-ref:e67d8aeb-939c-46e3-9be8-6fc3ba75ebc2