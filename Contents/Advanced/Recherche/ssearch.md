# Recherche spécialisée {#core-ref:f5708494-27c1-4bc9-8f2d-03b2ce4eb31d}

Pour toutes recherches non prévus en standard par l'interface, il est possoble de
programmer des recherches spécifiques. Elles pourront ensuite être utilisées
comme une recherche “normale” depuis l'interface grâce à la famille “recherche
spécialisée”. Lorsque vous éditer une recherche spécialisée, vous devez
renseigner le fichier php où se trouve la fonction de recherche et le nom de
cette fonction. Le fichier PHP devra être dans le répertoire `EXTERNALS`
sur votre serveur.

Les arguments de la fonctions sont au minimum de 3 :

*   start : start index pour la recherche
*   slice : nombre max d'éléments à retourner
*   userid : utilisateur courant


Exemple issu du fichier fdlsearches.php (livré en standard). 


    [php]
    /**
     * function use for specialised search
     * return all document tagged TOVIEWDOC for current user
     * 
     * @param int $start start cursor
     * @param int $slice offset ("ALL" means no limit)
     * @param int $userid user system identifier (NOT USE in this function)
     */
    function mytoviewdoc($start="0", $slice="ALL",$userid=0) {
    $tag="toview";
    $s=new searchDoc();
    $s->setObjectReturn(false);
    $s->join("id = docutag(id)");
    $s->setSlice($slice);
    $s->setStart($start);
    $s->addFilter("docutag.uid = %d",$userid);
    $s->addFilter("docutag.tag = '%s'",$tag);
    
    return $s->search();
    }

<span class="fixme">décrire enregistrement d'une SSEARCH</span>

Des arguments supplémentaires peuvent être ajoutés dans l'attribut 'Argument
PHP'. Il sont ajoutés dans l'appel à partir de la quatrième position. Pour
rajouter plusieurs arguments, il faut les séparer par une virgule (exemple :
1234,ceci est un test,dernier argument). Dans ces arguments, il est possible de
référencer des attributs du document recherche lui même. Il faut alors utiliser
la notation suivante %TITLE% pour avoir le titre de la recherche, ou %SE_IDCFLD%
pour avoir l'identifiant du dossier dans lequel s'exécute la recherche.

N'importe quel attribut ou propriété de la recherche est accessible. Le mot clef
%THIS%, permet d'obtenir l'objet recherche dans sa globalité. La fonction de
recherche doit retourner un tableau de document. 

Ces documents retournés doivent être de type array (pas object). Ce type est
celui retourné par la classe SearchDoc avec la méthode
`::setObjectReturn(false)`.
