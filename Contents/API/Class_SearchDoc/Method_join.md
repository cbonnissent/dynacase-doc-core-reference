# SearchDoc::join() {#core-ref:c7fe0a1b-e71a-45d4-9182-9e4561558030}

<div markdown="1" class="short-description"> 
    Cette méthode permet de faire une [jointure][jointure]. 
</div>


## Description {#core-ref:2843f343-933e-44a9-8e69-b65957da95d3}

    [php]
    void join( string $join )

Cette méthode permet d'ajouter via le mécanisme de jointure des critères
provenant d'une autre table de manière à établir des filtres complexes.

### Avertissements {#core-ref:bc000d20-1021-4367-9918-203468c6359a}

Les restrictions suivantes s'appliquent :

* une seule jointure est possible par SearchDoc,
* on ne peut utiliser la jointure que pour établir une recherche plus précise
  mais pas pour enrichir les résultats,
* on ne peut pas faire de jointure sur la table en cours.

## Liste des paramètres {#core-ref:3c057006-f9a4-4f0d-91c4-46bfc8288f22}

(string) `join`
:   La chaîne attendue doit être au format suivant :
    
<svg width="100%" height="160" viewBox="-8 -86 1160 160 " xmlns="http://www.w3.org/2000/svg" version="1.1">
<defs><style type="text/css">.terminal_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.terminal_text{fill:black;font-family:Verdana,Sans-serif;text-anchor:middle;font-size:14px;}.symbol_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.symbol_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-style:italic;text-anchor:middle;font-size:14px;}.path{fill:none;stroke:black;stroke-width:2;}.rule_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-size:14px;}.rule_path_edge{fill:none;stroke:black;stroke-width:3;}</style></defs>
<text class="rule_text" x="0" y="-64" >join:</text>
<rect class="symbol_rect" x="30" y="-14" width="146" height="28" rx="1" />
<text class="symbol_text" x="103" y="4" >attributeName</text>
<rect class="terminal_rect" x="236" y="-14" width="36" height="28" rx="28" />
<text class="terminal_text" x="254" y="4" >::</text>
<rect class="symbol_rect" x="296" y="-14" width="56" height="28" rx="1" />
<text class="symbol_text" x="324" y="4" >type</text>
<path class="path" d="M272 0 L296 0" />
<path class="path" d="M236 44 L252 44" />
<path class="path" d="M200 0 L236 0 M200 0 Q212 0 212 12 M388 0 L352 0 M388 0 Q376 0 376 12" />
<path class="path" d="M224 44 L236 44 M224 44 Q212 44 212 32 L212 12 M364 44 L252 44 M364 44 Q376 44 376 32 L376 12" />
<rect class="terminal_rect" x="436" y="-14" width="26" height="28" rx="28" />
<text class="terminal_text" x="449" y="4" > </text>
<path class="path" d="M436 0 L412 0 M424 0 Q412 0 412 -12 L412 -36 Q412 -48 424 -48 L474 -48 Q486 -48 486 -36 L486 -12 Q486 0 474 0 L462 0 L486 0" />
<rect class="symbol_rect" x="510" y="-14" width="96" height="28" rx="1" />
<text class="symbol_text" x="558" y="4" >operator</text>
<rect class="terminal_rect" x="654" y="-14" width="26" height="28" rx="28" />
<text class="terminal_text" x="667" y="4" > </text>
<path class="path" d="M654 0 L630 0 M642 0 Q630 0 630 -12 L630 -36 Q630 -48 642 -48 L692 -48 Q704 -48 704 -36 L704 -12 Q704 0 692 0 L680 0 L704 0" />
<rect class="symbol_rect" x="728" y="-14" width="116" height="28" rx="1" />
<text class="symbol_text" x="786" y="4" >familyName</text>
<rect class="terminal_rect" x="868" y="-14" width="26" height="28" rx="28" />
<text class="terminal_text" x="881" y="4" >(</text>
<rect class="symbol_rect" x="918" y="-14" width="146" height="28" rx="1" />
<text class="symbol_text" x="991" y="4" >attributeName</text>
<rect class="terminal_rect" x="1088" y="-14" width="26" height="28" rx="28" />
<text class="terminal_text" x="1101" y="4" >)</text>
<path class="path" d="M176 0 L200 0" />
<path class="path" d="M388 0 L412 0" />
<path class="path" d="M486 0 L510 0" />
<path class="path" d="M606 0 L630 0" />
<path class="path" d="M704 0 L728 0" />
<path class="path" d="M844 0 L868 0" />
<path class="path" d="M894 0 L918 0" />
<path class="path" d="M1064 0 L1088 0" />
<path class="path" d="M0 0 L30 0 M1144 0 L1114 0" />
<path class="rule_path_edge" d="M0 -6 L0 6 M1144 -6 L1144 6" />
</svg>
<br />
<br />
<svg width="184" height="264" viewBox="-8 -58 184 264 " xmlns="http://www.w3.org/2000/svg" version="1.1">
<defs><style type="text/css">.terminal_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.terminal_text{fill:black;font-family:Verdana,Sans-serif;text-anchor:middle;font-size:14px;}.symbol_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.symbol_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-style:italic;text-anchor:middle;font-size:14px;}.path{fill:none;stroke:black;stroke-width:2;}.rule_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-size:14px;}.rule_path_edge{fill:none;stroke:black;stroke-width:3;}</style></defs>
<text class="rule_text" x="0" y="-36" >operator:</text>
<rect class="terminal_rect" x="66" y="-14" width="26" height="28" rx="28" />
<text class="terminal_text" x="79" y="4" >&lt;</text>
<rect class="terminal_rect" x="66" y="30" width="26" height="28" rx="28" />
<text class="terminal_text" x="79" y="48" >&gt;</text>
<rect class="terminal_rect" x="66" y="74" width="26" height="28" rx="28" />
<text class="terminal_text" x="79" y="92" >=</text>
<rect class="terminal_rect" x="66" y="118" width="36" height="28" rx="28" />
<text class="terminal_text" x="84" y="136" >&lt;=</text>
<rect class="terminal_rect" x="66" y="162" width="36" height="28" rx="28" />
<text class="terminal_text" x="84" y="180" >&gt;=</text>
<path class="path" d="M30 0 L66 0 M30 0 Q42 0 42 12 M138 0 L92 0 M138 0 Q126 0 126 12" />
<path class="path" d="M54 44 L66 44 M54 44 Q42 44 42 32 L42 12 M114 44 L92 44 M114 44 Q126 44 126 32 L126 12" />
<path class="path" d="M54 88 L66 88 M54 88 Q42 88 42 76 L42 32 M114 88 L92 88 M114 88 Q126 88 126 76 L126 32" />
<path class="path" d="M54 132 L66 132 M54 132 Q42 132 42 120 L42 76 M114 132 L102 132 M114 132 Q126 132 126 120 L126 76" />
<path class="path" d="M54 176 L66 176 M54 176 Q42 176 42 164 L42 120 M114 176 L102 176 M114 176 Q126 176 126 164 L126 120" />
<path class="path" d="M0 0 L30 0 M168 0 L138 0" />
<path class="rule_path_edge" d="M0 -6 L0 6 M168 -6 L168 6" />
</svg>
<br />
<br />
<svg width="242" height="88" viewBox="-8 -58 242 88 " xmlns="http://www.w3.org/2000/svg" version="1.1">
<defs><style type="text/css">.terminal_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.terminal_text{fill:black;font-family:Verdana,Sans-serif;text-anchor:middle;font-size:14px;}.symbol_rect{fill:rgb(206,255,206);stroke:black;stroke-width:2;}.symbol_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-style:italic;text-anchor:middle;font-size:14px;}.path{fill:none;stroke:black;stroke-width:2;}.rule_text{fill:black;font-family:Verdana,Sans-serif;font-weight:bold;font-size:14px;}.rule_path_edge{fill:none;stroke:black;stroke-width:3;}</style></defs>
<text class="rule_text" x="0" y="-36" >type:</text>
<rect class="terminal_rect" x="30" y="-14" width="166" height="28" rx="28" />
<text class="terminal_text" x="113" y="4" >type postgresql</text>
<path class="path" d="M0 0 L30 0 M226 0 L196 0" />
<path class="rule_path_edge" d="M0 -6 L0 6 M226 -6 L226 6" />
</svg>

Ce qui donne en [BNF][WP_BNF] :

    join        ::= attributeName ( ('::'type)| ) (' ')+ operator (' ')+ familyName'('attributeName')'
    operator    ::= '<' | '>' | '=' | '<=' | '>='
    type        ::= 'type postgresql'

**Note** : La syntaxe de la chaîne attendue dans join n'est pas du SQL.


**Note** : Le [type postgreSql][pgtype] de l'attribut doit être modifié pour
être compatible avec le type de l'attribut retourné par la jointure, la fonction
[`::`][pgcast] permet de modifier le type d'une valeur postgreSql.

## Valeur de retour {#core-ref:126a809c-8208-4b8f-82ce-0fb4bedc8373}

void

## Erreurs / Exceptions {#core-ref:1b54cad4-edc1-4309-bdc5-593ace3a7f2f}

<span class="flag next-release">next release 3.2.12</span>

Exception `\Dcp\SearchDoc\Exception` si la jointure est syntaxiquement
incorrecte.


## Historique {#core-ref:91307533-be72-4656-ae6e-29b70dd88b6e}

### Release 3.2.12 {#core-ref:d2196eab-d77d-4ac6-9ae8-4b194548280a}

La méthode retourne une exception en cas d'erreur de syntaxe. Auparavant
l'erreur était remontée au niveau de la méthode `SearchDoc::search()`.

## Exemples {#core-ref:4a8470c2-7c01-4165-ab00-138e1aa453c2}

Recherche de tous les animaux dont le gardien a comme prénom "tom" :

    [php]
    function tomAnimals(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new searchDoc("", "ZOO_ANIMAL");
        $searchDoc->join("an_gardien::int = zoo_gardien(id)");
        $searchDoc->addFilter("zoo_gardien.firstname = 'tom'");
        $searchDoc->search();
        
        $err = $searchDoc->getError();
        if ($err !== "") {
            throw new Exception("Error Processing Search ".$err, 1);
        }
        
        var_export($searchDoc->getSearchInfo());
    }


## Notes {#core-ref:ae701512-b1fb-438b-ab03-493e18d164bd}

Aucune.

## Voir aussi {#core-ref:5add590f-d72c-48ca-8f59-b9a2ab3cdfd0}

Voir [la documentation avancée][exempleJointure].

<!-- links -->

[WP_BNF]: http://fr.wikipedia.org/wiki/Backus_Naur_Form "Définition de la Forme de Backus-Naur sur Wikipedia"
[pgtype]:   http://www.postgresql.org/docs/8.4/static/datatype.html "Postgresql : datatype"
[pgcast]:   http://www.postgresql.org/docs/8.4/static/sql-expressions.html#SQL-SYNTAX-TYPE-CASTS "Postgresql : cast"
[exempleJointure]:      #core-ref:82d4a6a8-39da-4ad1-a697-8da77c9aff07
[jointure]:    https://fr.wikipedia.org/wiki/Jointure_(informatique) "Définition sur Wikipédia"