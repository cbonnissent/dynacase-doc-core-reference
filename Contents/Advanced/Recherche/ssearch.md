# Recherche spécialisée {#core-ref:f5708494-27c1-4bc9-8f2d-03b2ce4eb31d}

Pour toutes recherches non prévues en standard par l'interface, il est possible
de programmer des recherches spécifiques. Elles pourront ensuite être utilisées
comme une recherche “normale” depuis l'interface grâce à la famille “recherche
spécialisée”. Lorsque vous éditer une recherche spécialisée, vous devez
renseigner le fichier php où se trouve la fonction de recherche et le nom de
cette fonction. Le fichier PHP devra être dans le répertoire `EXTERNALS` sur
votre serveur.

Les arguments de la fonction sont au minimum de 3 :

*   start : start index pour la recherche
*   slice : nombre max d'éléments à retourner
*   userid : utilisateur courant


Exemple  : fichier EXTERNALS/mytest.php :


    [php]
    namespace My;
    /**
     * function use for specialised search
     * return all document tagged TOVIEWDOC by current user
     * 
     * @param int $start start cursor
     * @param int $slice offset ("ALL" means no limit)
     * @param int $userid user system identifier (NOT USED in this function)
     */
    function myToViewTags($start="0", $slice="ALL",$userid=0) {
        $tag="TOVIEWDOC";
        $s=new \SearchDoc();
        $s->setObjectReturn(false);
        $s->join("id = docutag(id)");
        $s->setSlice($slice);
        $s->setStart($start);
        $s->addFilter("docutag.uid = %d",$userid);
        $s->addFilter("docutag.tag = '%s'",$tag);
        
        return $s->search();
    }

## Enregistrement d'une recherche spécialisée {#core-ref:a01ca5da-6e87-4e2f-a1f6-a834a20670ca}

L'enregistrement se fait en créant un document de la famille `SSEARCH`. Les
attributs `se_phpfile` et `se_phpfunc` permettent d'indiquer la fonction à
utiliser.

    [php]
    use \Dcp\AttributeIdentifiers as Attribute;
    
    /**
     * @var \Dcp\Family\Ssearch $rd
     */
    $sd = createDoc("", \Dcp\Family\Ssearch::familyName);
    $sd->setValue(Attribute\Ssearch::ba_title, "Search TOVIEWDOC Tag");
    $sd->setValue(Attribute\Ssearch::se_phpfile, "mytest.php"); // EXTERNALS/mytest.php
    $sd->setValue(Attribute\Ssearch::se_phpfunc, "My\\myToViewTags");
    $sd->store();

## Arguments supplémentaires de la fonction {#core-ref:64e7b7b7-188f-4576-a49f-f36b32664162}

Des arguments supplémentaires peuvent être ajoutés dans l'attribut 'Argument
PHP' (`se_phparg`). Il sont ajoutés dans l'appel à partir de la quatrième
position. Pour rajouter plusieurs arguments, il faut les séparer par une virgule
(exemple : `1234,ceci est un test,dernier argument`). Dans ces arguments, il est
possible de référencer des attributs du document recherche lui même. Il faut
alors utiliser la notation suivante %TITLE% pour avoir le titre de la recherche,
ou %SE_IDCFLD% pour avoir l'identifiant du dossier dans lequel s'exécute la
recherche.

N'importe quel attribut ou propriété de la recherche est accessible. Le mot clef
%THIS%, permet d'obtenir l'objet recherche dans sa globalité. La fonction de
recherche doit retourner un tableau de document. 

## Retour de la fonction {#core-ref:14319d25-7f8d-44dc-80ea-68c58e233533}

Ces documents retournés doivent être des documents bruts ( type `array` et non
object). Ce type est celui retourné par la classe SearchDoc en utilisant la méthode
`::setObjectReturn(false)`.
