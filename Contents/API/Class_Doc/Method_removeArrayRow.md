# Doc::removeArrayRow() {#core-ref:af3014ba-dbde-46f8-8d57-7c883cfc0c19}

<div class="short-description" markdown="1">

La méthode `removeArrayRow` permet de supprimer une ligne d'un attribut de
type [`array`][type_array].

</div>

## Description {#core-ref:0d24de18-e58b-46a1-8f2c-f9160bd735de}

    [php]
    string removeArrayRow ( string $idAttr,
    	                       int $index )

La méthode `removeArrayRow` permet de supprimer une ligne à un indice donnée
dans un attribut de type [`array`][type_array].

La ligne supprimée entraîne un décalage des lignes d'indice supérieur, qui
descendent alors toutes d'un cran.

### Avertissements {#core-ref:783dce78-c55f-42d6-b68e-6aff5d78a70c}

Lors de chaque appel à `removeArrayRow`, un setValue est effectué pour chacune
des colonnes de l'array. Pour supprimer de nombreuses lignes, il peut être plus
efficace de gérer manuellement la suppression dans chaque colonne.

## Liste des paramètres {#core-ref:44fa32fe-fe32-43aa-9232-6f22497ae0b9}

(string) `idAttr`
:   Le nom de l'attribut de type [`array`][type_array] dans lequel on souhaite
    supprimer une ligne.

(int) `index`
:   `index` permet de spécifier l'indice (à partir de 0) de la ligne qu'on
    souhaite supprimer.
    
    Si `index` est inférieur à 0 ou supérieur ou égal au nombre de lignes du
    tableau, alors le tableau n'est pas modifié et reste inchangé.
    
## Valeur de retour {#core-ref:f9703119-b701-4651-9001-3cbc3394e621}

La méthode retourne une chaîne vide s'il n'y a pas d'erreur, ou une chaîne
non-vide contenant le message d'erreur dans le cas contraire.

## Erreurs / Exceptions {#core-ref:7100eae8-8d1d-4cb7-b1d1-572cbe883d55}

Une erreur est retournée si :

* l'attribut `idAttr` n'est pas de type [`array`][type_array].

## Historique {#core-ref:a2047b03-ae70-456a-8259-7a77c5b1c701}

Aucun.

## Exemples {#core-ref:0f007ecf-6866-4e69-b4e9-301556dc35d1}

-   Exemple #1
    
        [php]
        /* Soit le tableau `MyPhoto::faces` composé comme suit :
        
           +-----------+----------+
           | Firstname | Lastname |
           +===========+==========+
        #0 | Bart      | Simpson  |
        #1 | Marge     | Simpson  |
        #2 | Lisa      | Simpson  |
        #3 | Homer     | Simpson  |
           +-----------+----------+
        */
        
        $photo->removeArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, 0)
        
        /* Après la suppression de la première ligne (indice 0) :
        
           +-----------+----------+
           | Firstname | Lastname |
           +===========+==========+
        #0 | Marge     | Simpson  |
        #1 | Lisa      | Simpson  |
        #2 | Homer     | Simpson  |
           +-----------+----------+
        */
        
        $photo->removeArrayRow(\Dcp\AttributeIdentifier\MyPhoto::faces, 1)
        
        /* Après la suppression de la ligne entre Marge et Homer (indice 1) :
        
           +-----------+----------+
           | Firstname | Lastname |
           +===========+==========+
        #0 | Marge     | Simpson  |
        #1 | Homer     | Simpson  |
           +-----------+----------+
        */

## Notes {#core-ref:e1109d54-0ce6-4ca8-bdae-28289cf9d152}

Aucune.

## Voir aussi {#core-ref:34036a5f-850a-4e2c-ab07-ed2a73a2fcdf}

- [`Doc::clearArrayValues`][Doc::clearArrayValues]
- [`Doc::addArrayRow`][Doc::addArrayRow]

<!-- links -->
[type_array]: #core-ref:dd400581-8896-4eec-9b9e-f1e5669cf180
[Doc::clearArrayValues]: #core-ref:ec1a6a50-1477-4326-b60b-c1d4ce5e4ef1
[Doc::addArrayRow]: #core-ref:d75110cb-24f6-4810-9b62-45ce6fd99e70
