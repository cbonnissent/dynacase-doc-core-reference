# Répétables multi-niveaux {#core-ref:8ecc747e-1010-4186-a1d7-5f73d25024c4}

Il est possible d'insérer plusieurs niveaux de structures multiples. Ce contrôle
des répétables s'appuie sur les méthodes présentées dans le chapitre
[affectation des répétables][repeat].

## Possibilités et limitations {#core-ref:7652a135-8f25-4388-9d51-38927af3acf1}

Il est possible d'avoir :

* des tableaux dans des tableaux,
* des tableaux dans des sections,
* des sections dans des tableaux,
* des listes dans des tableaux,
* des listes dans des sections.

Il n'est pas possible d'avoir :

* des listes avec des sous/listes, 
* des tableaux dans des listes,
* des sections dans des listes.

## Exemples {#core-ref:5680c624-acdb-458e-bf12-733449f43613}

Les deux exemples suivant montrent comment réaliser des templates à plusieurs
niveaux d'imbrications.

Le premier exemple illustre comment insérer des tables et des sous-tables. Le
deuxième exemple montre comment utiliser les sections openDocument pour
produire des paragraphes avec leur sous-paragraphes. 

### Exemple à deux niveaux d'imbrications : {#core-ref:af145b03-e4f8-4d47-964e-6e69536ccfcb}

    [php]
    public function testfruit($target) {
        $this->lay->set("TODAY", $this->getTimeDate());
        $repeatColor[] = array( 
            "COLOR"=>"jaune",
            "VEGETABLE"=>array("pomme","banane"),
            "DESCR"=>array("pommier", "bananier")
        );
        $repeatColor[] = array(
            "COLOR"=>"rouge",
            "VEGETABLE"=>array("cerise","fraise"),
            "DESCR"=>array("Cerisier","Fraisier")
        );
        $repeatColor[] = array(
            "COLOR"=>"vert",
            "VEGETABLE"=>array("concombre","cornichon","poivron"),
            "DESCR"=>array("Plante potagère", "Condiment","Capsicum annuum"));
        $this->lay->setRepeatable($repeatColor);
    }

Le template :
![ template ](advanced/template/odt_multiple_2_level_template.png)

donne le fichier :
![ résultat ](advanced/template/odt_multiple_2_level_generated.png)

### Exemple à trois niveaux d'imbrications : {#core-ref:08533a06-4a8a-4d21-b163-db152c33e452}

    [php]
    /**
    *@templateController
    */
    function testfruit($target) {
        $this->lay->set("TODAY",$this->getTimeDate());
        $repeatColor[] = array(
            "COLOR" => "jaune",
            "VEGETABLE" => array("pomme","banane"),
            "VARIETY" => array(
                array("granny", "fuji","golden"),array("plantain")
            )
        );
        $repeatColor[] = array(
            "COLOR" => "rouge",
            "VEGETABLE" => array("cerise","fraise"),
            "VARIETY" => array(
                array("bigarreau","griotte"),
                array("mara des bois","agate","anabelle")
            )
        );
        $repeatColor[] = array(
            "COLOR"=>"vert",
            "VEGETABLE"=>array("concombre","cornichon","poivron"),
            "VARIETY"=>array(
                array("gynial","Cucumis sativus"),
                array("vert de paris"),
                array("doux sonar","jericho")
            )
        );
        $this->lay->setRepeatable($repeatColor);
    }

Le template :
![ template ](advanced/template/odt_multiple_3_level_template.png)

donne le fichier :
![ résultat ](advanced/template/odt_multiple_3_level_generated.png)

*Note* : Ici il faut bien imbriquer les sections pour être conforme à la
structure du répétable défini dans le code (Niveau 1 : `COLOR`, Niveau 2 :
`VEGETABLE`, Niveau 3 : `VARIETY`).

<!-- link -->
[repeat]:   #core-ref:9c954528-4c99-4423-ace2-0c445bc698ca