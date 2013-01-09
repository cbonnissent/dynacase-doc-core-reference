# Recherche spécialisée {#core-ref:1eb7c0ad-dabd-47e9-83bf-f9e3d4eca806}

## Présentation {#core-ref:dbdf08fa-7cd2-4cb0-a112-3cf91d8f3956}

Dans le cas d'une recherche très spécifique, il peut être nécessaire de
construire cette recherche de toutes parts. La famille *recherche spécialisée*
permet de fournir le code php de la recherche.

Elle est implémentée au moyen de la famille `SSEARCH`, qui étend la famille
`SEARCH` et y ajoute les méthodes du fichier `Method.SpecialSearch.php`.

## Éléments de paramétrage {#core-ref:0abdd1f1-07ea-4ac5-88d5-bac41fa2ddc4}

Lors de l'édition d'une recherche spécialisée, vous devez renseigner

*   le nom du fichier php où se trouve la fonction de recherche  
    (ce fichier doit être dans le répertoire `/EXTERNALS` du serveur),
*   le nom de fonction de recherche.
    
    Les arguments de la fonctions sont au minimum de 3 :
    *   start : start index pour la recherche
    *   slice : nombre maximum d'éléments à retourner
    *   userid : identifiant de l'utilisateur courant
    
    Des arguments supplémentaires peuvent être ajoutés
    dans l'attribut 'Argument PHP'.  
    Il sont ajoutés dans l'appel à partir de la quatrième position.
    
    Pour rajouter plusieurs arguments, il faut les séparer par une virgule
    (exemple : 1234,ceci est un test,dernier argument).
    
    Dans ces arguments, il est possible de référencer
    
    *   des attributs du document recherche lui même.
        Il faut alors utiliser la notation 
        *   `%[PROPERTYID]%` pour avoir la valeur de la propriété *PROPERTYID*,
        *   `%[ATTRID]%` pour avoir la valeur de l'attribut *ATTRID*
        *   `%THIS%`, pour avoir l'objet recherche.
    
    La fonction de recherche doit retourner un tableau de documents.
    
    Ces documents retournés doivent être de type array, et non des objets.

## Exemples {#core-ref:24d15951-fff9-4555-a021-c74411439d59}

### Exemple issu du fichier `fdlsearches.php` (livré en standard).  {#core-ref:573c6af9-8846-43d3-9830-632543df9d19}

    [php]
    /**
     * return all documents having user tag $tag
     */
    function mytagdoc($start="0", $slice="ALL",$tag,$userid=0)
    {
        $s=new searchDoc();
        
        //joins with table docutag, using id=docutag.id
        $s->join("id = docutag(id)");
        
        //do not return objects
        $s->setObjectReturn(false);
        
        $s->setSlice($slice);
        $s->setStart($start);
        $s->addFilter("docutag.uid = %d", $userid);
        $s->addFilter("docutag.tag = '%s'", $tag);
        
        return $s->search();
    }
    
    /**
     * function use for specialised search
     * return all document tagged TOVIEWDOC for current user
     * 
     * @param int $start start cursor
     * @param int $slice offset ("ALL" means no limit)
     * @param int $userid user system identifier (NOT USE in this function)
     */
    function mytoviewdoc($start="0", $slice="ALL",$userid=0) {
        return mytagdoc($start, $slice, "TOVIEW", $userid);
    }

