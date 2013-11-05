# Répétables multi-niveaux {#core-ref:8ecc747e-1010-4186-a1d7-5f73d25024c4}

Il est possible d'insérer plusieurs niveaux de structures multiples. En utilisant
les méthodes présentées dans le chapitre [affectation des répétables][repeat].

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

Nous allons maintenant voir deux exemples :

* deux niveaux d'imbrications :
    
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
* trois niveaux d’imbrications :
    
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