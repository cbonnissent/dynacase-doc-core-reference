# Format de liste de documents {#core-ref:74ce9ce4-8e4e-42ee-a0df-415eb6897a81}

Le formatage permet de récupérer les éléments des documents qui peuvent être
utilisés dans un but de présentation de ces données à l'utilisateur (interface
homme-machine ou exportation). Pour récupérer le formatage il faut utiliser la
classe `FormatCollection`.

Exemple pour le formatage des documents 9 et 12.

    [php]
    $dl=new DocumentList();
    $dl->addDocumentIdentifiers(array(9,12)); // 
    
    $fl=new FormatCollection();
    $fl->useCollection($dl);
    $r=$fl->render();

Le résultat du "render" donne un tableau avec une entrée par document formaté.
Par défaut seul le titre et l'identifiant est retourné, aucun attribut n'est
utilisé. Chaque entrée contient un champ "properties" indiquant les propriétés
et un champ "attributes" contenant les attributs. Ce dernier est vide si aucun
attribut n'a été indiqué dans le formatage.

    [php]
    Array 
    ( 
        [0] => Array 
            ( 
                ["properties"] => Array 
                    ( 
                        ["id"] => 12
                        ["title"] => "les profils" 
                    ) 
            ) 
        [1] => Array 
            ( 
                ["properties"] => Array 
                    ( 
                        ["id"] => 9 
                        ["title"] => "Racine" 
                    ) 
            ) 
    ) 

## Formatage des propriétés {#core-ref:9ebcbfd6-d094-45ee-a993-9b221fb4d893}

Les valeurs des propriétés sont directement notées dans le tableau "properties"
sauf l'état. Pour l'état du document les informations suivantes sont disponibles
:

*   `reference`
: clef de l'étape

*   `color`
: couleur de l'étape

*   `activity` 
: activité de l'étape (vide si document est figé, - ancienne révision - )

*   `stateLabel` 
: libellé de l'état de l'étape

*   `displayValue` 
: libellé de l'étape. Il est égal à l'activité si le document est en dernière révision et si l'activité est déclarée sinon il est égal au libellé de l'état.

Exemple :

    [php]
    $s=new SearchDoc('',"ZOO_TEST");
    $s->setObjectReturn();
    $dl=$s->search()->getDocumentList();
    
    $fl=new FormatCollection();
    $fl->useCollection($dl);
    $fl->addProperty($fl::propState);
    $r=$fl->render();
    print_r($r);

Le résultat est :

    [php]
    ["properties"] => Array 
                ( 
                    ["id"] => 67978 
                    ["title"] => "Nouga" 
                    ["state"] => statePropertyValue Object 
                        ( 
                            ["reference"] => "zoo_transmited" 
                            ["color"] => "#A8DF78" 
                            ["activity"] => "Vérification de l'adoption" 
                            ["stateLabel"] => "Transmis" 
                            ["displayValue"] => "Vérification de l'adoption" 
                        ) 
                ) 
                
## Formatage des attributs {#core-ref:683390ec-6b17-4ade-be6e-6085f4893f7f}

Les valeurs des attributs se placent dans le tableau "attributes". Chacun des
attribut a un champ "value" qui indique la valeur brute et "displayValue" qui
indique la valeur affichable.  Pour ajouter les attributs à formater  il faut
utiliser la méthode "addAttribute".

    [php]
    $fl=new FormatCollection();
    $fl->useCollection($dl);
    $fl->addAttribute("tst_title")->addAttribute("tst_double");
    $r=$fl->render();

Extrait de la partie "attributes"

    [php]
    [attributes] => Array
                (
                    ["tst_title"] => textAttributeValue Object
                        (
                            ["value"] => "Test 1"
                            ["displayValue"] => "Test 1"
                        )
                    ["tst_double"] => doubleAttributeValue Object
                        (
                            ["value"] => 0
                            ["displayValue"] => "0,00"
                        )

Si un attribut n'a pas de valeur, le formatage sera "null" quelque soit le type
d'attribut. Si un attribut n'existe pas la structure (value, displayValue) sera
remplie avec la variable identifiée par la méthode "::setNc()".

    [php]
    $s=new SearchDoc('',"DIR");
    $s->setObjectReturn();
    $dl=$s->search()->getDocumentList();
    $fl=new FormatCollection();
    $fl->useCollection($dl);
    $fl->setNc("nc");
    $fl->addProperty($fl::propState);
    $fl->addAttribute("tst_title")->addAttribute("ba_desc");
    $r=$fl->render();


Exemple avec un attribut "vide" (ba_desc) et un attribut inexistant.

    [php]
    [attributes] => Array 
                    ( 
                        ["tst_title"] => unknowAttributeValue Object 
                            ( 
                                ["value"] => "nc" 
                                ["displayValue"] => "nc" 
                            ) 
                        ["ba_desc"] => null
                    ) 

Si l'option "showempty" est indiquée dans l'attribut, le rendu d'une valeur
nulle sera remplacée par la valeur de l'option.


## Rendu des attributs {#core-ref:f62199d8-8388-48a2-b79a-327307b58a86}

### type `text` {#core-ref:5de7150f-c887-481d-95d4-51a54df7363a}

    [php]
    ["tst_text"] => textAttributeValue Object
                    (
                        ["value"] => "Testing"
                        ["displayValue"] => "before Testing"
                    )

La valeur formatée tient compte du format mis dans le type 
dans cet exemple : text("before %s")


### type `int` {#core-ref:4f6dcf5c-f929-429e-8158-94aedec2eaa4}

    [php]
    [tst_int] => intAttributeValue Object
                        (
                            ["value"] => 10
                            ["displayValue"] => "0010"
                        )
                        
La valeur formatée tient compte du format mis dans le type.
dans cet exemple : int("%04d"). La valeur est de type "int"

### type `double` {#core-ref:84b38e2a-d231-4fc3-9ccc-e78b8b90a949}

    [php]
    [tst_double] => doubleAttributeValue Object
                        (
                            ["value"] => 0
                            ["displayValue"] => "0,00"
                        )

La valeur formatée tient compte du format mis dans le type. dans cet exemple :
double("%.02f"). Le point est transformé en virgule si la locale est "fr_FR". La
valeur est de type "double"


### type `date` {#core-ref:3f8e0b89-db33-4be8-b68e-15f709ecd0a8}

    [php]
    [tst_date] => dateAttributeValue Object
                        (
                            ["value"] => "2012-06-08"
                            ["displayValue"] => "08/06/2012"
                        )

La valeur formatée tient compte du format mis dans le type. S'il n'y a pas de
format, cela dépend du format de la locale de l'utilisateur.

### type `timestamp` {#core-ref:4bdcbdc6-018a-456c-9747-96b3825f6275}

    [php]
    [tst_ts] => dateAttributeValue Object
                        (
                            ["value"] => "2012-06-13 11:27:00"
                            ["displayValue"] => "13/06/2012 11:27"
                        )

La valeur formatée tient compte du format mis dans le type. S'il n'y a pas de
format, cela dépend du format de la locale de l'utilisateur.

### type `file` {#core-ref:732f5207-8e22-4e21-86d4-f8023fdd2706}

    [php]
    [tst_file] => fileAttributeValue Object
        (
            ["size"] => 5
            ["creationDate"] => "2012-06-12 16:06:15"
            ["fileName"] => "Test.txt"
            ["url"] => "file/84412/3380/tst_file/-1he=no&inline=no"
            ["mime"] => "text/plain"
            ["icon"] => "Images/mime-txt.png"
            ["value"] => "text/plain; charset=us-at.txt"
            ["displayValue"] => "Test.txt"
        )

La valeur formatée est le titre du fichier. l'url est le lien permettant de
télécharger le fichier.

### type `image` {#core-ref:483885aa-4f79-4dfb-821c-d991f435f956}

    [php]
    ["tst_img"] => imageAttributeValue Object
    (
        ["thumbnail"] => "fst_img/-1/add.png?no&inline=yes&width=48"
        ["size"] => 363
        ["creationDate"] => "2012-06-12 16:06:15"
        ["fileName"] => "add.png"
        ["url"] => "file/84412/3381/tst_img/-1o&inline=no"
        ["mime"] => "image/png"
        ["icon"] => "Images/mime-image2.png"
        ["value"] => "image/png; charset=binary|3"
        ["displayValue"] => "add.png"
     )

Idem File. En plus l'attribut 'thumbnail' permet d'avoir un lien permettant
d'afficher la miniature de l'image. La largeur de la miniature peut être définie
avec l'attribut imageThumbnailSize de la classe FormatCollection. Elle est de
48px par défaut.

### type `docid` - `account` {#core-ref:95aee029-f729-41f9-9b18-a6c20813c24d}

    [php]
    ["tst_relation"] => docidAttributeValue Object
    (
        ["familyRelation"] => "TST_FMTCOL"
        ["url"] => "?app=FDL&amp;OPENDOC&amp;mode=view&amp;id=84412&amp;latest=Y"
        ["icon"] => "resizeimg.php?img=Images/test.png&size=14"
        ["value"] => 84412
        ["displayValue"] => "Test 1"
    )

'familyRelation" indique le format du type de relation. La valeur formatée
indique le titre du document pointé. L'url permet d'accéder à la consultation du
document. La taille de l'icone du document pointé est par défaut de 14px. Elle
peut être modifiée avec l'attribut relationIconSize de la classe
FormatCollection.

### type `enum` {#core-ref:ddcd138f-acbd-46f0-bf82-2227399536dc}

    [php]
    ["tst_enum"] => enumAttributeValue Object
    (
        ["value"] => 1
        ["displayValue"] => "Un"
    )

La valeur formatée donne le libellé de l'énuméré.

### Autres types {#core-ref:45f81665-a96a-406b-8722-a161340b15eb}

    [php]
    ["x_attr"] => standardAttributeValue Object
    (
        ["value"] => "12:20:00"
        ["displayValue"] => "12:20:00"
    )

La valeur et la valeur formatée sont égales.

## Rendu des attributs multiples {#core-ref:2256843a-e63f-484b-a00d-c2a85253deea}

Les attributs multiples sont rendus dans des tableaux de structure.
Exemple avec deux valeurs de l'attribut "tst_colors".

    [php]
    ["tst_colors"] => Array
    (
        [0] => standardAttributeValue Object
            (
                ["value"] => "#80CCFF"
                ["displayValue"] => "#80CCFF"
            )
        [1] => standardAttributeValue Object
            (
                ["value"] => "#FFD77A"
                ["displayValue"] => "#FFD77A"
            )
    )

La même structure à deux niveaux est rendue pour les multiples dans les
tableaux. Cela est limité à l'attribut docid.

    [php]
    [tst_relation_multiple] => Array
    (
       [0] => Array
           (
               [0] => docidAttributeValue Object
                   (
                       ["familyRelation"] => "TST_FMTCOL"
                       ["url"] => "?app=FDL&amp;action=OPENDOC..."
                       ["icon"] => 
                       ["value"] => 84412
                       ["displayValue"] => "Test 1"
                   )
           )
       [1] => Array
           (
               [0] => docidAttributeValue Object
                   (
                       ["familyRelation"] => "TST_FMTCOL"
                       ["url"] => ?"app=FDL&amp;action=OPENDOC..."
                       ["icon"] => 
                       ["value"] => 84412
                       ["displayValue"] => "Test 1"
                   )
               [1] => docidAttributeValue Object
                   (
                       ["familyRelation"] => "TST_FMTCOL"
                       ["url"] => "?app=FDL&amp;action=OPENDOC..."
                       ["icon"] => 
                       ["value"] => 86854
                       ["displayValue"] => "Test 2"
                   )
