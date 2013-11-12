# Recherche d'objets : QueryDb {#core-ref:f0aa6a88-444c-4b2d-9a09-820f037f908d}

La recherche d'objets est réalisée par la classe `QueryDb`. Elle permet
d'effectuer des requêtes sur un type d'objet.

Le constructeur attend le nom de la classe en deuxième paramètre du
constructeur. Le premier paramètre optionnel doit contenir les coordonnées de la
base de données.

    [php]
    $query=new QueryDb("", "DocHisto");
    $query->addQuery("id=1004");
    $result=$q->query(0,0,"ITER");
    
    foreach ($result as $histo) {
      print_r($histo->getValues());
    }

L'exemple ci-dessus donne tous les objets [`DocHisto`][dbhisto] du document
1004. Ceci est l'équivalent de ce qui est fait avec la méthode
`doc::addHistoryEntry()`.

La méthode `QueryDb::addQuery($filter)` permet d'ajouter un filtre sql à la
requête.

La méthode `QueryDb:query($start, $slice, $mode)` lance la requête et retourne
les résultats.
Les paramètres sont :

* $start : c'est l'offset à partir de combien d'éléments le retour commence, si
jamais $start est à 10 les 10 premiers résultats trouvés par la requête ne sont
pas retournés,
* $slice : c'est le nombre maximum de résultat à retourner, 
* $mode : il peut avoir soit les valeurs 
    * `TABLE` : `TABLE` retourne un array de valeurs indexées par leur nom.
    * `ITER` : alors le retour est un objet [itérateur][phpIterator] qui permet 
    d'avoir accès aux [objets][dbObj].

    [php]
    $result=$query->query(0,0,"TABLE");
    foreach ($result as $histo) {
       print_r($histo);
    }

Résultat :

    [php]
    Array 
    ( 
        [id] => 1004 
        [initid] => 1004 
        [uid] => 1 
        [uname] => "Default Master" 
        [date] => "14/12/2010 14:49:47" 
        [level] => 2 
        [code] => 
        [comment] => "Mise à jour par importation" 
    ) 
    Array 
    ( 
        [id] => 1004 
        [initid] => 1004 
        [uid] => 1 
        [uname] => "Default Master" 
        [date] => "14/12/2010 14:49:46" 
        [level] => 2 
        [code] => CREATE 
        [comment] => "Création du document" 
    )


<!-- links -->
[dbaccount]:        #core-ref:6d5684f4-73e8-431c-8b2b-6224a9e6b074 "Table users"
[dbhisto]:          #core-ref:dc380a30-61b1-4a51-997b-6a3e8f5e1fed "Table dochisto"
[phpIterator]:      http://us3.php.net/manual/en/class.iterator.php "The Iterator interface"
[dbObj]:            #core-ref:7a62bb83-17a0-478d-a853-bc359d0fb8fb