# Classe Dir {#core-ref:dd2077e0-7f3d-4974-bdb0-62a92427754d}

La famille `DIR`, et celles qui en héritent, permettent de grouper des
documents Dynacase comme on le ferait avec des fichiers et des répertoires.

Le document de la famille `DIR` est alors appelé un dossier.

Les méthodes de la famille `DIR` permettent de gérer le référencement (ajout ou
suppression) de documents dans des dossiers.

Par défaut, n'importe quel type de document peut être inséré dans un dossier.

Un dossier peut être paramétré pour ne pouvoir recevoir que certains types de
documents, c'est ce qu'on nomme la [restriction][restriction].

Lors de l'ajout des documents, des hameçons peuvent être appelés.

## Restrictions {#core-ref:ad55c0a7-fc0f-4c9d-95cb-8286f4057c3f}

La restriction ed'un dossier st paramétrée à l'aide des attributs :
- [`FLD_ALLBUT`][fld_allbut]
- [`FLD_FAMIDS`][fld_famids]

### Attribut FLD_ALLBUT {#core-ref:9d1e4708-439b-484c-bb1f-a80031e6a20a}

L'attribut [`FLD_ALLBUT`][fld_allbut] est un énuméré qui peut prendre deux
valeurs (`0` ou `1`) et qui permet de spécifier le mode de restriction :

`0` (tout sauf)
:   Autorise l'insertion de tous les types de documents à l'exception d'une liste
    déterminée de famille à exclure.

`1` (seulement)
:   N'autorise que l'insertion de documents d'un type déterminée.

### FDL_FAMIDS {#core-ref:61ece13c-6fbd-4e1b-a7f3-3b1d7bae264c}

L'attribut [`FLD_FAMIDS`][fld_famids] est un attribut multivalué qui contient
des identifiants de familles, et qui permet de spécifier la liste des familles à
autoriser ou à exclure (en fonction de la valeur de l'attribut
[`FDL_ALLBUT`][fld_allbut]).

### Exemple de paramétrage de restriction {#core-ref:a4fcc391-2e6c-453d-ae1e-2eeef88d00d8}

Example 1 :

    [php]
    /*
     * N'autoriser que l'insertion de documents issues
     * des familles FAM_A et FAM_B
     */
    
    $idFamA = getIdFromName('FAM_A');
    $idFamB = getIdFromName('FAM_B')
    
    $dossier->setAttributeValue('FLD_ALLBUT', 1);
    $dossier->setAttributeValue('FLD_FAMIDS', array($idFamA, $idFamB)));
    $dossier->modify();

<!-- links -->
[restriction]: #core-ref:ad55c0a7-fc0f-4c9d-95cb-8286f4057c3f
[fld_allbut]: #core-ref:9d1e4708-439b-484c-bb1f-a80031e6a20a
[fld_famids]: #core-ref:61ece13c-6fbd-4e1b-a7f3-3b1d7bae264c