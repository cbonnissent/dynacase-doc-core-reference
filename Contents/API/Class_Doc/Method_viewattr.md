# Doc::viewattr() {#core-ref:71bb6fe5-b094-4811-a72b-35628c5a9391}

<div class="short-description" markdown="1">

Cette méthode permet d'ajouter les clefs correspondantes aux attributs du
document pour la composition d'une [vue][docvue] de consultation spécifique.

</div>

## Description {#core-ref:9be4486d-2a22-46a4-8f3c-8311b208f6f2}

    [php]
    void viewattr ( string $target     = "_self", 
                      bool $ulink      = true, 
                      bool $abstract   = false, 
                      bool $viewhidden = false)

Cette méthode ajoute pour chaque attribut pouvant contenir une valeur :

*   une clef contenant la valeur affichable de l'attribut, 
*   une clef pour le libellé de l'attribut.
*   une clef pour indiquer si la valeur de l'attribut est vide ou non.

La clef de valeur est composée du préfixe `V_` suivi de l'identifiant de
l'attribut en **majuscule**. La valeur affichable est fournie par la méthode
`DocHtmlFormat::getHtmlValue()`. Les attributs de type `array` ont aussi leur
clef générée.

La clef de libellé est composée du préfixe `L_` suivi de l'identifiant de
l'attribut en **majuscule**. Le libellé est dépendant de la [locale][fami18n] de
l'utilisateur. La valeur du libellé est fournie par la méthode
`Doc::getLabel()`.

La clef de nullité de la valeur est composée du préfixe `S_` suivi du nom de
l'identifiant de l'attribut en **majuscule**. Cette clef vaut `false` si la
valeur brute de l'attribut est vide (chaine `""`). Elle vaut `true` dans le cas
contraire.


### Avertissements {#core-ref:abdfe7cb-1ad7-424c-a44d-b4e8c958a784}

Les attributs de type `tab`, `frame` et `menu` n'ont pas de clef générée.

## Liste des paramètres {#core-ref:54f057ef-0ff6-484a-8810-d543fb785081}


(string) `target`
:   Indique la [cible][htmlatarget] des [hyperliens][attrlink] pour les 
    attributs qui en disposent.  
    Valeur spéciale :

*   `ooo` : Si on utilise les clefs pour une composition de 
    [template ODT][odttemplate]. Dans ce cas, les valeurs en XML sont retournées.

(bool) `ulink`
:   Indique si les hyperliens doivent être générés. Si `target` égal à `ooo`, 
    aucun lien n'est généré quelque soit la valeur de `ulink`.  
    Si `true`, alors les hyperliens sont générés  
    Si `false`, alors les hyperliens ne sont pas générés

(bool) `abstract`
:   Si `true`, alors seuls les attributs ["résumé"][abstractattr] sont affichés  
    Si `false`, alors la caractéristique "résumé" n'est pas prise en compte.  

(bool) `viewhidden`
:   Si `true`, les attributs en [visibilité][visibility] `H` sont affichés.  
:   Si `false`, les attributs en visibilité `H` ne sont pas affichés.  
    Les attributs en visibilité `I` et `O` ne sont pas affichés. Leur clefs 
    sont générés vides.


## Valeur de retour {#core-ref:d803c0e4-7814-4a43-83c3-e480439bdc93}

void.

## Erreurs / Exceptions {#core-ref:3e586845-9bff-45eb-bae5-c7f1903f9d65}

Aucune.

## Historique {#core-ref:c0261136-2328-4203-91f9-35c18b77f305}

Aucun.

## Exemples {#core-ref:77839274-785a-4e10-8532-7910e7b3756e}

Soit la famille `MY_ANIMAL` qui possède les attributs suivants :

|     nom      |  type |
| ------------ | ----- |
| AN_NOM       | text  |
| AN_PHOTO     | image |
| AN_NAISSANCE | date  |

Fichier de la classe associées à la famille : 

    [php]
    namespace MyTest;
    class My_animal extends \Dcp\Family\Document
    {
      /**
       * @templateController view original photo
       */
      public function viewPhoto($target="_self", $ulink=true, $abstract=false) {
        $this->viewAttr($target, $ulink, $abstract);
      } 
    }

Template `viewPhoto.html` :

    [html]
    <h1>[TEXT:My name is] : [V_AN_NOM]</h1>
    <p>[TEXT:My birthday date is] : <strong>[V_AN_NAISSANCE]</strong></p>
    [IF S_AN_PHOTO]<img class="photo" src="[V_AN_PHOTO]"/>[ENDIF S_AN_PHOTO]
    [IFNOT S_AN_PHOTO]<p>[TEXT:No photo]</p>[ENDIF S_AN_PHOTO]

Résultat :

    [html]
    <h1>My name is : Rotor</h1>
    <p>My birthday date is : <strong>03/08/2012</strong></p>
    <img class="photo" src="file/1419/41/an_photo/-1/1387_IMG_1684AFC2.jpg?cache=no&inline=no"/>

Rendu HTML :

![Usage de Doc::viewAttr()](API/viewattr1.png)

## Notes {#core-ref:dff330b3-3ee5-4a02-ae0f-c97ae87e5571}

Exemple de retour pour les valeurs formatées en fonction du type de l'attribut.

| Type      | Format                             | Multiple | Valeur brute                                                            | Valeur HTML                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| --------- | ---------------------------------- | -      - | ---------------------------------------------------------------------   | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| text      |                                    |          | Un                                                                      | Un                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| text      |                                    |          | Éléonore                                                                | &Eacute;l&eacute;onore                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| longtext  |                                    |          | Et\nLa suite en été<b>...                                               | Et&lt;br /&gt;<br /> La suite en &amp;eacute;t&amp;eacute;&amp;lt;b&amp;gt;...                                                                                                                                                                                                                                                                                                                                                                                         |
| money     |                                    |          | 2.54                                                                    | 2,54                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| double    |                                    |          | 3.1415926                                                               | 3.1415926                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| int       |                                    |          | 1                                                                       | 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| date      |                                    |          | 2013-04-20                                                              | 20/04/2013                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| time      |                                    |          | 01:00:00                                                                | 01:00                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| timestamp |                                    |          | 2013-09-30 10:00:00                                                     | 30/09/2013 10:00                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| image     |                                    |          | image/jpeg; charset=binary &#124; 42&#124; 1387_IMG_1684AFC2.jpg        | file/1419/41/an_photo/-1/1387_IMG_1684AFC2.jpg?cache=no&inline=no                                                                                                                                                                                                                                                                                                                                                                                                      |
| file      |                                    |          | application/vnd.oasis.opendocument.spreadsheet&#124; 1330&#124; fdl.ods | &lt;a onmousedown=&quot;document.noselect=true;&quot; title=&quot;34Ko&quot; target=&quot;_blank&quot; type=&quot;application/vnd.oasis.opendocument.spreadsheet&quot; href=&quot;file/5388/1330/fi_file/-1/fdl.ods?cache=no&amp;inline=no&quot;&gt;&lt;img class=&quot;mime&quot; needresize=1  src=&quot;Images/mime-spreadsheet.png&quot;&gt;&amp;nbsp;fdl.ods&lt;/a&gt;                                                                                            |
| docid     | TST_MY_FAMILY                      |          | 5384                                                                    | &lt;a oncontextmenu=&quot;popdoc(event,'?&amp;amp;app=FDL&amp;amp;action=OPENDOC&amp;amp;mode=view&amp;amp;id=5384&amp;amp;latest=Y');return false;&quot; documentId=&quot;5384&quot; class=&quot;relation&quot; style=&quot;background-image:url(resizeimg.php?img=Images%2Fdoc.png&amp;size=14)&quot; target=&quot;_self&quot; href=&quot;?&amp;amp;app=FDL&amp;amp;action=OPENDOC&amp;amp;mode=view&amp;amp;id=5384&amp;amp;latest=Y&quot;&gt;Z&eacute;ro&lt;/a&gt; |
| account   |                                    |          | 6394                                                                    | &lt;a oncontextmenu=&quot;popdoc(event,'?&amp;amp;app=FDL&amp;amp;action=OPENDOC&amp;amp;mode=view&amp;amp;id=6394&amp;amp;latest=Y');return false;&quot; documentId=&quot;6394&quot; class=&quot;relation&quot; style=&quot;background-image:url(resizeimg.php?img=Images%2iuser.png&amp;size=14)&quot; target=&quot;_self&quot; href=&quot;?&amp;amp;app=FDL&amp;amp;action=OPENDOC&amp;amp;mode=view&amp;amp;id=6394&amp;amp;latest=Y&quot;&gt;John Doe&lt;/a&gt;   |
| enum      | a&#124;One,b&#124;Two,c&#124;Three |          | a                                                                       | One                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| color     |                                    |          | #f3f                                                                    | &lt;span style=&quot;background-color:#f3f&quot;&gt;#f3f&lt;/span&gt;                                                                                                                                                                                                                                                                                                                                                                                                  |
| enum      | a&#124;A,b&#124;B,c&#124;C         | X        | a\nb\nc                                                                 | A&lt;BR&gt;B&lt;BR&gt;C                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| text      |                                    | X        | Un\nDeux                                                                | Un&lt;BR&gt;Deux                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| money     |                                    | X        | 3                                                                       | 3,00                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| double    |                                    | X        | -54                                                                     | -54                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| date      |                                    | X        | 2013-04-20                                                              | 20/04/2013                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| time      |                                    | X        | 10:00                                                                   | 10:00                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| timestamp |                                    | X        | 2013-09-30 10:00                                                        | 30/09/2013 10:00                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| enum      | a&#124;A,b&#124;B,c&#124;C         | X        | a                                                                       | A                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| color     |                                    | X        | #ff33ff\n#45e098                                                        | &lt;span style=&quot;background-color:#ff33ff&quot;&gt;#ff33ff&lt;/span&gt;&lt;BR&gt;&lt;span style=&quot;background-color:#45e098&quot;&gt;#45e098&lt;/span&gt;                                                                                                                                                                                                                                                                                                       |
| longtext  |                                    | X        | Un<BR>Deux\nTrois<BR>Quatre                                             | Un&lt;br /&gt;<br /> Deux&lt;BR&gt;Trois&lt;br /&gt;<br /> Quatre                                                                                                                                                                                                                                                                                                                                                                                                      |
| int       |                                    | X        | 1\n2\n3                                                                 | 1&lt;BR&gt;2&lt;BR&gt;3                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| double    |                                    | X        | \n\n                                                                    | &lt;BR&gt;&lt;BR&gt;                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| text      | [%s]                               |          | Document Un                                                             | [Document Un]                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| longtext  |                                    |          | Et\nLa suite...                                                         | Et&lt;br /&gt;<br /> La suite...                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| money     | %s €                               |          | 2.54                                                                    | 2,54 &euro;                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| double    | %.03f                              |          | 3.1415926                                                               | 3.142                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| int       | %03d                               |          | 1                                                                       | 001                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| date      | %A %e %B %Y                        |          | 2013-04-20                                                              | samedi 20 avril 2013                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| time      | %kh %Mmin %Ss                      |          | 01:00:00                                                                | 1h 00min 00s                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| timestamp | %A %e %B %Y %Hh %Mmin %Ss          |          | 2013-09-30 10:00:00                                                     | lundi 30 septembre 2013 10h 00min 00s                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| text      | [%s]                               | X        | Un\nDeux                                                                | [Un]&lt;BR&gt;[Deux]                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| money     | %s $                               |          | 3                                                                       | 3,00 $                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| double    | %.03f                              |          | -54                                                                     | -54.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| date      | %A %e %B %Y                        |          | 2013-04-20                                                              | samedi 20 avril 2013                                                                                                                                                                                                                                                                                                                                                                                                                                                   |



## Voir aussi {#core-ref:f29e0c19-14b1-49ba-8c8e-24f2a3d8fe2b}

*   [Vue de document][docvue],
*   [Zone pour les cadres][zoneframe],
*   [`Doc::editattr()`][editattr].

<!-- links -->
[docvue]:           #core-ref:cb3e2b97-ee6d-4cdf-aa25-b2e41d0d3156
[fami18n]:          #core-ref:f5872ef4-4170-11e3-ba58-48f953959281
[attrlink]:         #core-ref:aaaa5d78-0982-4c3e-a8ed-a125c49572a8
[htmlatarget]:      http://reference.sitepoint.com/html/a/target "Définition Html <a> Href"
[odttemplate]:      #core-ref:a8c2d27a-6490-4449-9997-2984613ed219
[abstractattr]:     #core-ref:39825a45-a204-440b-ab0c-608e765eb88c
[visibility]:       #core-ref:3e67d45e-1fed-446d-82b5-ba941addc7e8
[editattr]:         #core-ref:3157f5b6-06d5-4bbb-b951-d72aec3341c9
[zoneframe]:        #core-ref:48746351-91bb-4d34-b892-972f9253b9f5