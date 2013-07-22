# Recherche détaillée {#core-ref:b0bc6976-8eb3-4ba0-9999-241ecf7b1682}

## Enregistrement d'une recherche détaillée


## Utilisation de méthodes dans l'interface de recherche détaillée 

Lors de la création d'une recherche détaillée, il est possible de choisir pour
un critère une méthode comme valeur.

    Exemple : ma_date > ::getDate(-7)

Cet exemple indique que le critère sera la date courante - 7 jours. La méthode doc::getDate() est une méthode statique de la classe doc.

Les méthodes utilisables dans les recherches détaillées sont les méthodes du document qui ont un commentaire (au format DocBlock : http://www.phpdoc.org/docs/latest/for-users/anatomy-of-a-docblock.html) et  qui contiennent les tags "@searchLabel" et "@searchType".
Vous pouvez ainsi déclarer votre propre méthode, utilisable comme critère de recherche, dans le fichier méthode de votre famille et ajouter les commentaires DocBlock adéquats.
Cette méthode est généralement statique car elle ne doit pas faire appel à des valeurs de document. Par contre vous pouvez bien entendu utiliser des paramètres de la famille. La valeur de retour de cette méthode sera utilisé comme valeur du critère. Cela ne peut être appliqué que sur des opérateurs nécessitant une seule valeur.
Cette méthode spécifique sera utilisable pour des recherches détaillées portant sur la famille en question.

Exemple de déclaration de méthode :

    [php]
    /**
     * Get a random integer between 1 and 10
     * 
     * @searchLabel Random integer between 1 and 10
     * @searchType int
     * @searchType double
     * @searchType money
     */
    public function getRandomNumber() {
      return mt_rand(1, 10);
    }

Le tag `@searchLabel` permet de spécifier le libellé qui sera présenté lors de
l'affichage de la liste des méthodes compatibles. Ce libellé sera traduit via le
mécanisme de localisation de Dynacase (voir chapitre « 3.12 Localisation
(Traduction de dynacase dans d'autres langues) »).

Le tag `@searchType` permet de spécifier les types d'attributs sur lesquels
cette méthode est utilisable. L'interface de composition des critères de la
recherche détaillée ne présentera alors que les méthodes compatibles avec
l'attribut du critère.

Pour des besoins plus complexes de sélection des méthodes compatibles, vous
pouvez surcharger la méthode `Doc::getSearchMethods()` pour enlever ou ajouter
des méthodes à la liste générée par défaut. Les méthodes que vous ajoutez
devront aussi avoir les tags `@searchLabel` et `@searchType` positionnée.

Exemple de surcharge de `Doc::getSearchMethods` :

    [php]
    public function getSearchMethods($attrId, $attrType) {
        $methods = parent::getSearchMethods($attrId, $attrType);
        if ($attrType == 'date' || $attrType == 'timestamp') {
            /*
             * Ajouter avant-hier et après-demain
             * pour les attributs de type 'date' et 'timestamp'
             */
            $methods = array_merge(
                $methods,
                array(
                    array(
                        'label' => _("Day before yesterday"),
                        'method' => '::getDate(-2)'
                    ),
                    array(
                        'label' => _("Day after tomorrow"),
                        'method' => '::getDate(2)'
                    )
                )
            );
        }
        return $methods
    }
