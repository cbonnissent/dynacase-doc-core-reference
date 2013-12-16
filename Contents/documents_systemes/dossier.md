# Les dossiers {#core-ref:aa28a2c3-e74d-4b36-ad8f-ae1bb93b6726}

Les dossiers permettent de grouper des documents. 
Cette fonction est analogue à la fonction de [répertoires][repertoire]
présents dans les systèmes de fichiers.

**Important** : Un dossier ne gère que des références à des documents. Au
contraire du répertoire qui, dans un système de fichiers, impose que les
fichiers soient liés *physiquement* à un répertoire. Cela implique les faits
suivants :

*   La suppression d'un dossier n'entraîne pas la suppression de ses références
*   L'accès à un dossier ne contraint pas l'accès à une des ses références
*   Les références entre dossiers peuvent conduire à des boucles dans l'arborescence
*   Un document ou un dossier peut être référencé dans aucun ou plusieurs dossiers

Par défaut, n'importe quelle famille de document peut être insérée dans un
dossier. Un dossier peut être paramétré pour ne contenir que certaines familles
de documents, c'est ce qu'on nomme la [restriction][restriction].

## Restrictions {#core-ref:ad55c0a7-fc0f-4c9d-95cb-8286f4057c3f}

La restriction d'un dossier st paramétrée à l'aide des attributs :

*   [`FLD_ALLBUT`][fld_allbut]
*   [`FLD_FAMIDS`][fld_famids]

### Attribut FLD_ALLBUT {#core-ref:9d1e4708-439b-484c-bb1f-a80031e6a20a}

L'attribut [`FLD_ALLBUT`][fld_allbut] est un énuméré qui peut prendre deux
valeurs (`0` ou `1`) et qui permet de spécifier le mode de restriction :

`0` (tout sauf)
:   Autorise l'insertion de toutes les familles de documents à l'exception d'une liste
    déterminée de famille à exclure.

`1` (seulement)
:   N'autorise que l'insertion de documents des familles déterminées.

### FDL_FAMIDS {#core-ref:61ece13c-6fbd-4e1b-a7f3-3b1d7bae264c}

L'attribut [`FLD_FAMIDS`][fld_famids] est un attribut multivalué qui contient
des identifiants de familles, et qui permet de spécifier la liste des familles à
autoriser ou à exclure (en fonction de la valeur de l'attribut
[`FDL_ALLBUT`][fld_allbut]).

### Exemple de paramétrage de restriction {#core-ref:a4fcc391-2e6c-453d-ae1e-2eeef88d00d8}

Exemple 1 :

    [php]
    /**
     * @var Dir $myFolder
     */
    $myFolder = new_doc(getDbAccess(), "My_FOLDER");
    /*
      * N'autoriser que l'insertion de documents issues
      * des familles FAM_A et FAM_B
      */
      
    $idFamA = getIdFromName(getDbAccess(), 'FAM_A');
    $idFamB = getIdFromName(getDbAccess(), 'FAM_B');
    
    $myFolder->setAttributeValue(\Dcp\AttributeIdentifiers\Dir::fld_allbut, 1);
    $myFolder->setAttributeValue(\Dcp\AttributeIdentifiers\Dir::fld_famids, array($idFamA, $idFamB));
    $myFolder->store();


## Profil de dossier {#core-ref:0cd3fe9a-57cf-481f-8fc0-560bc71d6430}

(droit sur le profil de dossier `PDIR`)
## Profil de contenu {#core-ref:a14f99fc-eb7f-4930-b282-857649690dd1}


## Voir aussi {#core-ref:19c8e77e-ba1b-4deb-bb6d-f52670284773}

Voir la classe [`Dir`][dir] qui contient les méthodes spécifiques aux dossiers.

<!-- links -->
[repertoire]:   http://fr.wikipedia.org/wiki/R%C3%A9pertoire_%28informatique%29 "Répertoire sur Wikipédia"
[restriction]: #core-ref:ad55c0a7-fc0f-4c9d-95cb-8286f4057c3f
[fld_allbut]:  #core-ref:9d1e4708-439b-484c-bb1f-a80031e6a20a
[fld_famids]:  #core-ref:61ece13c-6fbd-4e1b-a7f3-3b1d7bae264c
[dir]:         #core-ref:dd2077e0-7f3d-4974-bdb0-62a92427754d