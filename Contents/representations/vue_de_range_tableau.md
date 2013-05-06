# Vue de rangée de tableau {#core-ref:9e76ac49-3b17-435b-ba25-a7122369be85}

Les vues de rangée de tableau permettent de mettre en forme un tableau. Cela est
particulièrement utile pour des tableaux contenant beaucoup d'attributs, ou dont
la structure est complexe. Il est ainsi possible de changer la disposition des
éléments pour, par exemple, regrouper plusieurs attributs dans la même colonne.

Contrairement aux vues de document, ou aux vues d'attribut, les vues de rangée
de tableau ne contiennent pas de code. Elles sont donc uniquement composées de :

*   un fichier de template, définissant le structure.

Par convention :

*   le fichier de template porte l'extension xml,
*   son nom détermine le nom de la vue.

## syntaxe du template

un template de vue de rangés de tableau est un fichier xml **valide**.
Il doit respecter la `dtd` suivante :

    [dtd]
    <?xml version="1.0" encoding="UTF-8" ?>
    <!ELEMENT table (table-head,table-body)>
    
    <!ELEMENT table-head (cell)+>
    <!ELEMENT table-body (cell)+>
    
    <!ELEMENT cell (#PCDATA)>
    <!ATTLIST cell
        class CDATA #IMPLIED
        style CDATA #IMPLIED>

Voici un exemple de fichier valide (ici, la dtd est déclarée inline, mais elle
n'est pas obligatoire) :

    [xml]
    <?xml version="1.0" encoding="UTF-8" ?>
    <!DOCTYPE table [
        <!ELEMENT table (table-head,table-body)>
        
        <!ELEMENT table-head (cell)+>
        <!ELEMENT table-body (cell)+>
        
        <!ELEMENT cell (#PCDATA)>
        <!ATTLIST cell
            class CDATA #IMPLIED
            style CDATA #IMPLIED>
    ]>
    <table>
        <table-head>
            <cell>…</cell>
        </table-head>
        <table-body>
            <cell>…</cell>
        </table-body>
    </table>

*   Le bloc `table-head` définit le `thead` du tableau généré.
*   Le bloc `table-body` définit le `tbody` du tableau généré.
*   Chaque balise `cell` définit une cellule et set donc retranscrite sous la
    forme d'une balise `td`.
    *   Les attributs `style` et `class` de la balise `cell` sont transmis
        tels-quels à la balise `td` résultante.
    *   Les autres attributs sont ignorés
    *   le contenu de la balise `td` résultante est exactement le contenu de la
        balise `cell`. ce dernier doit donc être du xhtml valide.  
        **Attention** : puisque le document est interprété en *xml pur*, pour
        utiliser des entités html, il faut les déclarer dans la dtd (par
        exemple: `<!ENTITY nbsp "&#160;">`).

## Vue de consultation

<span class="fixme" data-assignedto="EBR">modèle de boites / zones ?</span>

Afin de spécifier la vue d'attribut à utiliser en consultation, il faut utiliser
l'option `rowviewzone`.<span class="fixme" data-assignedto="EBR">à documenter dans les options d'attribut ?</span>

### Utilisation des valeurs du document

Lors de l'utilisation des vues de rangés de tableau, les clés suivantes sont
instanciées :

*   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
*   `V_ATTRID` pour chaque attribut : la valeur (au format html) de l'attribut,
*   `ATTRID` pour chaque attribut : la valeur brute de l'attribut.

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, les clés `L_ATTRID` et `V_ATTRID` seront
des chaînes vides.

De plus, il est possible, comme dans tous les templates, d'utiliser :

*   les paramètres globaux,
*   les chaînes traduisibles (syntaxe `[TEXT:…]`).

## Vue de modification

<span class="fixme" data-assignedto="EBR">modèle de boites / zones ?</span>

Afin de spécifier la vue d'attribut à utiliser en consultation, il faut utiliser
l'option `roweditzone`.<span class="fixme" data-assignedto="EBR">à documenter dans les options d'attribut ?</span>

### Utilisation des valeurs du document

Lors de l'utilisation des vues de rangés de tableau, les clés suivantes sont
instanciées :

*   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
*   `V_ATTRID` pour chaque attribut : l'input correspondant à l'attribut,
*   `ATTRID` pour chaque attribut : la valeur brute de l'attribut.

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, les clés `L_ATTRID` et `V_ATTRID` seront
des chaînes vides.

De plus, il est possible, comme dans tous les templates, d'utiliser :

*   les paramètres globaux,
*   les chaînes traduisibles (syntaxe `[TEXT:…]`).