# Doc::editattr() {#core-ref:3157f5b6-06d5-4bbb-b951-d72aec3341c9}

<div class="short-description" markdown="1">

Cette méthode permet d'ajouter les clefs correspondantes aux attributs du
document pour la composition d'une [vue][docvue] de **formulaire** HTML
spécifique de document.

</div>


## Description {#core-ref:65fba574-1eb1-4710-bad7-698f5263605a}

    [php]
    void editattr ( bool $withtd = true )

Cette méthode ajoute pour chaque attribut pouvant contenir une valeur :

*   une clef contenant le champ de saisie de l'attribut pour le formulaire,

Pour tous les attributs pouvant contenir une valeur ainsi que les attributs
encadrants :

*   une clef pour le libellé de l'attribut.


La clef du champ de saisie est composée du préfixe `V_` suivi de l'identifiant
de l'attribut en **majuscule**. Le champ de saisie est fournie par la méthode
`DocFormFormat::getHtmlInput()`.

Si les attributs sont en [visibilité][visibility] `H` ou `R`, le champs de
saisie est un champ caché : `<input type="hidden"/>`.

Si l'attribut est en visibilité `I`, la clef pour le champ de saisie est vide.

La clef de libellé est composée du préfixe `L_` suivi de l'identifiant de
l'attribut en **majuscule**. Le libellé est dépendant de la [locale][fami18n] de
l'utilisateur. La valeur du libellé est fournie par la méthode
`Doc::getLabel()`. Si l'attribut est obligatoire, le libellé est entouré des
balises `<b>` et `</b>`.


### Avertissements {#core-ref:f4cc3bc8-a041-4926-b223-9ce515018798}

Les attributs de type `tab`, `frame`, `menu` n'ont pas de clef
générée pour les champs de saisie.

Les rendus obtenus peuvent varier selon les différentes versions de Dynacase.
Les noms des champs de saisie ("input name") restent stables. 


## Liste des paramètres {#core-ref:d5939fb9-3d9f-49ae-a8fe-95622d29e6b0}


(bool) `withtd`
:   Indique si les champs de saisie sont incorporés dans un tableau HTML.  
    Si `true`, alors les balises `</td><td>` sont insérés entre le champs de 
    saisie et les boutons d'aide à la saisie. 
    Si `false`, les boutons d'aide à la saisie sont mis directement à la suite
    du champs de saisie.


## Valeur de retour {#core-ref:3e5d030a-cf9b-4234-b402-7bf15cd7c7ae}

void.

## Erreurs / Exceptions {#core-ref:9737e545-ce7b-4f1a-a6d1-bdb9460f3a06}

Aucune.

## Historique {#core-ref:945a3b03-4a3c-452c-a680-0934d4092f10}

Aucun.

## Exemples {#core-ref:b64d98dc-cc3d-4c65-80a1-f6a8dcef9459}

### Rendu en dehors d'un tableau. {#core-ref:06db2b3a-9199-4d95-978e-d675ee72bd75}


Soit la famille `MY_ANIMAL` qui possède les attributs suivants :

|     nom      |  type |
| ------------ | ----- |
| AN_NOM       | text  |
| AN_PHOTO     | image |
| AN_NAISSANCE | date  |

Formulaire spécifique pour modifier le nom, la date de naissance et la
photographie. Dans cet exemple, on affiche la photo en 200px.

Fichier de la classe associées à la famille : 

    [php]
    namespace MyTest;
    class My_animal extends \Dcp\Family\Document
    {
          /**
           * @templateController edit original photo
           */
          public function editPhoto() {
            $this->editAttr(false);
            $photoUrl=$this->getHtmlAttrValue("an_photo");
            $this->lay->set("bigPhoto", $photoUrl);
          } 
    }

Template `editPhoto.html` :

    [html]
    <div class="myname">
       <label for="an_nom">[L_AN_NOM]</label> : [V_AN_NOM]
    </div>
    <div class="birthday">
       <img title="[L_AN_NAISSANCE]" src="[IMG:birthday.png|64]"/> : [V_AN_NAISSANCE]
    </div>
    
    <div class="photo">
       <img class="big" src="[bigPhoto]&width=200" /><br/>
       [V_AN_PHOTO]
    </div>

Résultat :

    [html]
    <div class="myname">
       <label for="an_nom"><B>nom</B></label> : <input  onchange="document.isChanged=true"     type="text" name="_an_nom" value="Th&eacute;odor" id="an_nom"  > 
    </div>
    <div class="birthday">
       <img title="date de naissance" src="resizeimg.php?img=Images%2Fbirthday.png&size=64"/> : <input  readonly="readonly" size="10" autocomplete="off"
             onfocus="if (this.readOnly) $('#ic_an_naissance').trigger('mousedown').trigger('click')" 
            onblur="control_date(event,this)" type="text" name="_an_naissance" value="10/08/2011" id="an_naissance" /><input type="button" onmousedown="Calendar_Init('an_naissance','ic_an_naissance',false,'%d/%m/%Y')" class="inlineButton" id="ic_an_naissance" value="&#133;" /><input type="button" value="&diams;" id="id_an_naissance"    title="Date manuelle" onmousedown="document.getElementById('an_naissance').disabled=false;document.getElementById('an_naissance').readOnly=false" onclick="focus_date(event,'an_naissance')" class="inlineButton" /><input id="ix_an_naissance" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_naissance'],'')">
    </div>
    
    <div class="photo">
       <img class="big" src="file/1420/42/an_photo/-1/250px-Alligator.jpg?cache=no&inline=no&width=200" /><br/>
       <span id="IFERRan_photo" class="Error"></span><span class="FREEDOMText"><a target="_self" href="file/1420/42/an_photo/-1/250px-Alligator.jpg?cache=no&inline=no"  title="250px-Alligator.jpg"><img id="img_an_photo" style="vertical-align:bottom;border:none;width:30px" src="file/1420/42/an_photo/-1/250px-Alligator.jpg?cache=no&inline=yes&width=30"></a></span><br/><input name="_an_photo" type="hidden" value="image/jpeg; charset=binary|42|250px-Alligator.jpg" id="an_photo"><input type="hidden" value="image/jpeg; charset=binary|42|250px-Alligator.jpg" id="INIVan_photo"><span><input onchange="document.isChanged=true;changeFile(this,'an_photo','')"  accept="image/*" size=15 type="file" id="IF_an_photo" name="_UPL_an_photo" ></span> <input id="ix_an_photo" type="button" style="vertical-align:baseline" class="inlineButton" value="&times;" title="Effacer le fichier" title1="Effacer le fichier" value1="&times;" title2="Annuler l'effacement du fichier" value2="&minus;" onclick="clearFile(this,'an_photo')">
    </div>


Rendu HTML en ajoutant le style suivant :

    [css]
    div.photo {
       border : 2px solid grey;
       width:300px;
       padding:10px;
    }
    div.myname {
       border : 2px solid grey;
       width:300px;
       padding:10px;    
       border-style: solid solid none solid;
    }
    div.birthday {
        border-style: none solid none solid;
        padding: 10px;
        width: 300px;
        border-width: 2px;
        border-color: grey;
    }
    div.photo img.big {
       width:300px;
    }
    div.photo input[type="file"] {
        width: 270px;
    }
    div.photo input, div.myname input {
        height: 30px;
    }
    .birthday > img {
        vertical-align: middle;
    }
    .birthday input, div.myname input {
        vertical-align: middle;
        font-size:20px;
    }
    .birthday input[type=button] {
        width:30px;
    }
    #img_an_photo {
       display:none;
    }

![Usage de Doc::editAttr()](API/editattr1.png)


### Rendu dans un tableau {#core-ref:414911f4-399c-492b-b86f-4ce7239eb7dc}

Cet exemple affiche les champs de saisie dans un tableau. Les boutons d'aides à
la saisies sont alignés car ils sont dans des cellules séparées.

Soit la famille `MY_ANIMAL` qui possède les attributs suivants :

|     nom      |   type  |
| ------------ | ------- |
| AN_NOM       | text    |
| AN_ENTREE    | date    |
| AN_NAISSANCE | date    |
| AN_GARDIEN   | account |
| AN_SEXE      | enum    |
| AN_ESPECE    | docid   |

    [php]
    namespace MyTest;
    class My_animal extends \Dcp\Family\Document
    {
         /**
           * @templateController edit some data
           */
          public function editData() {
            $this->editAttr(true); // affichage avec "</td><td>"
          } 
    }


Template `editData.html` :

    [html]
    <table class="myTable">
      <tr>
        <td class="myLabel">[L_AN_NOM]</td><td  class="myInput">[V_AN_NOM]</td>
        <td class="myLabel">[L_AN_NAISSANCE]</td><td class="myInput">[V_AN_NAISSANCE]</td>
      </tr>
      <tr>
        <td class="myLabel">[L_AN_ESPECE]</td><td class="myInput">[V_AN_ESPECE]</td>
        <td class="myLabel">[L_AN_SEXE]</td><td class="myInput">[V_AN_SEXE]</td>
      </tr>
      <tr>
        <td class="myLabel">[L_AN_GARDIEN]</td><td class="myInput">[V_AN_GARDIEN]</td>
        <td class="myLabel">[L_AN_ENTREE]</td><td class="myInput">[V_AN_ENTREE]</td>
      </tr>
    </table>

Résultat :


    [html]
    <table class="myTable">
      <tr>
        <td class="myLabel"><B>nom</B></td><td  class="myInput"><input  onchange="document.isChanged=true"  class="fullresize"   type="text" name="_an_nom" value="Th&eacute;odor" id="an_nom"  > </td><td class="nowrap"></td>
        <td class="myLabel">date de naissance</td><td class="myInput"><input  readonly="readonly" size="10" autocomplete="off"
             onfocus="if (this.readOnly) $('#ic_an_naissance').trigger('mousedown').trigger('click')" 
            onblur="control_date(event,this)" type="text" name="_an_naissance" value="10/08/2011" id="an_naissance" /><input type="button" onmousedown="Calendar_Init('an_naissance','ic_an_naissance',false,'%d/%m/%Y')" class="inlineButton" id="ic_an_naissance" value="&#133;" /><input type="button" value="&diams;" id="id_an_naissance"    title="Date manuelle" onmousedown="document.getElementById('an_naissance').disabled=false;document.getElementById('an_naissance').readOnly=false" onclick="focus_date(event,'an_naissance')" class="inlineButton" /><input id="ix_an_naissance" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_naissance'],'')"></td><td class="nowrap"></td>
      </tr>
      <tr>
        <td class="myLabel"><B>espèce</B></td><td class="myInput"><input type="hidden"  name="_an_espece" id="an_espece" value="1295"><input class="fullresize"  autocomplete="off" autoinput="1" onfocus="activeAuto(event,1420,this,'','an_espece','')"   onchange="addmdocs('_an_espece');document.isChanged=true" type="text" name="_ilink_an_espece" id="ilink_an_espece" value="Alligator"></td><td class="editbutton"><input id="ic_ilink_an_espece" type="button" class="inlineButton" value="&#133;" title="choisir une valeur pour espèce" onclick="sendAutoChoice(event,1420,this,'ilink_an_espece','','an_espece','')"><input id="ix_an_espece" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_espece','ilink_an_espece'],'','an_espece' )"><input id="icr_an_espece" class="add-doc" type="button" value="&nbsp;" titleedit="créer un document espèce" titleview="Modifier le document" onclick="editRelation('ZOO_ESPECE',elinkvalue('an_espece'),'an_espece','&es_nom='+elinkvalue('ilink_an_espece')+'')"></td>
        <td class="myLabel">sexe</td><td class="myInput"><span id="sp_an_sexe"><select  name="_an_sexe" id="an_sexe"  onchange="disableReadAttribute();" >
    <option selected value="M">Masculin</option>
    <option  value="F">Féminin</option>
    <option  value="H">Hermaphrodite</option>
    </select>
    
    </span>
    </td><td class="nowrap"></td>
      </tr>
      <tr>
        <td class="myLabel">gardien responsable</td><td class="myInput"><input type="hidden"  name="_an_gardien" id="an_gardien" value=""><input class="fullresize"  autocomplete="off" autoinput="1" onfocus="activeAuto(event,1420,this,'','an_gardien','')"   onchange="addmdocs('_an_gardien');document.isChanged=true" type="text" name="_ilink_an_gardien" id="ilink_an_gardien" value=""></td><td class="editbutton"><input id="ic_ilink_an_gardien" type="button" class="inlineButton" value="&#133;" title="choisir une valeur pour gardien responsable" onclick="sendAutoChoice(event,1420,this,'ilink_an_gardien','','an_gardien','')"><input id="ix_an_gardien" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_gardien','ilink_an_gardien'],'','an_gardien' )"></td>
        <td class="myLabel">date d'entrée</td><td class="myInput"><input  readonly="readonly" size="10" autocomplete="off"
             onfocus="if (this.readOnly) $('#ic_an_entree').trigger('mousedown').trigger('click')" 
            onblur="control_date(event,this)" type="text" name="_an_entree" value="" id="an_entree" /><input type="button" onmousedown="Calendar_Init('an_entree','ic_an_entree',false,'%d/%m/%Y')" class="inlineButton" id="ic_an_entree" value="&#133;" /><input type="button" value="&diams;" id="id_an_entree"    title="Date manuelle" onmousedown="document.getElementById('an_entree').disabled=false;document.getElementById('an_entree').readOnly=false" onclick="focus_date(event,'an_entree')" class="inlineButton" /><input id="ix_an_entree" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_entree'],'')"></td><td class="nowrap"></td>
      </tr>
    </table>


Rendu HTML en ajoutant le style suivant :

    [css]
    .myLabel {
      background-color:#F2FF5F;
    }
    .myLabel:first-letter {
      text-transform:capitalize;
    }
    .myinput {
      background-color:white;
    }
      .myinput + td {
      background-color:white;
    }
    .myTable {
      border-collapse: separate;
      border-spacing: 10px;
      border: solid 1px grey;
    }
    .document table.myTable input[type=button] {
      width:20px;
      height:20px;
      font-size: 15px;
    }


![Affichage dans un tableau avec Doc::editAttr()](API/editattr2.png)

### Variante Rendu dans un tableau {#core-ref:734ce27e-01fa-4b57-a4f8-9fadb870430c}

Le contrôleur est identique au précédent exemple. Cette variante permet
d'illustrer comment prendre en compte les champs de saisie dans un tableau
personnalisé.

Dans cet exemple, les libellés des attributs sont placés dans des rangées au
dessus des champs de saisies.

Template `editData.html` :

    [html]
    <table class="myLabelUp">
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_NOM]</div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_NAISSANCE]</div></td>
      </tr>
      <tr>
        <td class="myInput">[V_AN_NOM]</td>
        <td class="myInput">[V_AN_NAISSANCE]</td>
      </tr>
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_ESPECE]</div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_SEXE]</div></td>
      </tr>
      <tr>
        <td class="myInput">[V_AN_ESPECE]</td>
        <td class="myInput">[V_AN_SEXE]</td>
      </tr>
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_GARDIEN]</div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">[L_AN_ENTREE]</div></td>
      </tr>
      <tr>
        <td class="myInput">[V_AN_GARDIEN]</td>
        <td class="myInput">[V_AN_ENTREE]</td>
      </tr>
    </table>

On notera dans ce template, l'utilisation du `colspan` dans les libellés pour
prendre en compte les balises `</td><td>` ajoutées par les clefs de champs de
saisies.

Résultat :

    [html]
    <table class="myLabelUp">
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel"><B>nom</B></div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">date de naissance</div></td>
      </tr>
      <tr>
        <td class="myInput"><input  onchange="document.isChanged=true"  class="fullresize"   type="text" name="_an_nom" value="Th&eacute;odor" id="an_nom"  > </td><td class="nowrap"></td>
        <td class="myInput"><input  readonly="readonly" size="10" autocomplete="off"
             onfocus="if (this.readOnly) $('#ic_an_naissance').trigger('mousedown').trigger('click')" 
            onblur="control_date(event,this)" type="text" name="_an_naissance" value="10/08/2011" id="an_naissance" /><input type="button" onmousedown="Calendar_Init('an_naissance','ic_an_naissance',false,'%d/%m/%Y')" class="inlineButton" id="ic_an_naissance" value="&#133;" /><input type="button" value="&diams;" id="id_an_naissance"    title="Date manuelle" onmousedown="document.getElementById('an_naissance').disabled=false;document.getElementById('an_naissance').readOnly=false" onclick="focus_date(event,'an_naissance')" class="inlineButton" /><input id="ix_an_naissance" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_naissance'],'')"></td><td class="nowrap"></td>
      </tr>
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel"><B>espèce</B></div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">sexe</div></td>
      </tr>
      <tr>
        <td class="myInput"><input type="hidden"  name="_an_espece" id="an_espece" value="1295"><input class="fullresize"  autocomplete="off" autoinput="1" onfocus="activeAuto(event,1420,this,'','an_espece','')"   onchange="addmdocs('_an_espece');document.isChanged=true" type="text" name="_ilink_an_espece" id="ilink_an_espece" value="Alligator"></td><td class="editbutton"><input id="ic_ilink_an_espece" type="button" class="inlineButton" value="&#133;" title="choisir une valeur pour espèce" onclick="sendAutoChoice(event,1420,this,'ilink_an_espece','','an_espece','')"><input id="ix_an_espece" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_espece','ilink_an_espece'],'','an_espece' )"><input id="icr_an_espece" class="add-doc" type="button" value="&nbsp;" titleedit="créer un document espèce" titleview="Modifier le document" onclick="editRelation('ZOO_ESPECE',elinkvalue('an_espece'),'an_espece','&es_nom='+elinkvalue('ilink_an_espece')+'')"></td>
        <td class="myInput"><span id="sp_an_sexe"><select  name="_an_sexe" id="an_sexe"  onchange="disableReadAttribute();" >
    <option selected value="M">Masculin</option>
    <option  value="F">Féminin</option>
    <option  value="H">Hermaphrodite</option>
    </select>
    
    </span>
    </td><td class="nowrap"></td>
      </tr>
      <tr>
        <td colspan="2" class="myLabel"><div class="myLabel">gardien responsable</div></td>
        <td colspan="2" class="myLabel"><div class="myLabel">date d'entrée</div></td>
      </tr>
      <tr>
        <td class="myInput"><input type="hidden"  name="_an_gardien" id="an_gardien" value=""><input class="fullresize"  autocomplete="off" autoinput="1" onfocus="activeAuto(event,1420,this,'','an_gardien','')"   onchange="addmdocs('_an_gardien');document.isChanged=true" type="text" name="_ilink_an_gardien" id="ilink_an_gardien" value=""></td><td class="editbutton"><input id="ic_ilink_an_gardien" type="button" class="inlineButton" value="&#133;" title="choisir une valeur pour gardien responsable" onclick="sendAutoChoice(event,1420,this,'ilink_an_gardien','','an_gardien','')"><input id="ix_an_gardien" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_gardien','ilink_an_gardien'],'','an_gardien' )"></td>
        <td class="myInput"><input  readonly="readonly" size="10" autocomplete="off"
             onfocus="if (this.readOnly) $('#ic_an_entree').trigger('mousedown').trigger('click')" 
            onblur="control_date(event,this)" type="text" name="_an_entree" value="" id="an_entree" /><input type="button" onmousedown="Calendar_Init('an_entree','ic_an_entree',false,'%d/%m/%Y')" class="inlineButton" id="ic_an_entree" value="&#133;" /><input type="button" value="&diams;" id="id_an_entree"    title="Date manuelle" onmousedown="document.getElementById('an_entree').disabled=false;document.getElementById('an_entree').readOnly=false" onclick="focus_date(event,'an_entree')" class="inlineButton" /><input id="ix_an_entree" type="button" class="inlineButton" value="&times;" title="effacer entrée(s)" onclick="clearInputs(['an_entree'],'')"></td><td class="nowrap"></td>
      </tr>
    </table>

Rendu HTML en ajoutant le style suivant :

    [css]
    .myLabel {
      background-color:#F2FF5F;
    }
    .myLabel:first-letter {
      text-transform:capitalize;
    }
    .myinput {
      background-color:white;
    }
      .myinput + td {
      background-color:white;
    }
    .myLabelUp {
      border-collapse: collapse;
      border-spacing: initial;
    }
    .myLabelUp td {
      vertical-align:bottom;
    }
    .myLabelUp td.myInput {
       width:300px;
       border-style: none none solid solid;
       border-width: 1px;
       border-color: grey;
       margin : 4px;
    }
    .myLabelUp td.myLabel {
       width:300px;
       border-style: solid solid none solid;
       border-width: 1px;
       border-color: grey;
       margin : 4px;
    }
    .myLabelUp td.myInput + td {
       border-style: none solid solid none;
       border-width: 1px;
       border-color: grey;
       margin : 4px;
    }
    .myLabelUp .myLabel {
      background-color:#F2FF5F;
      padding: 3px;
    }


![Variante d'affichage dans un tableau avec Doc::editAttr()](API/editattr3.png)

## Notes {#core-ref:53fda517-647f-4f02-b7b5-408d4235288f}

Aucune.

## Voir aussi {#core-ref:6d7c4513-f131-4319-88b7-0983ad91e2a5}


*   [Vue de document][docvue],
*   [Zone d'édition de cadre][zoneeditframe],
*   [Zone d'édition de tableau][zoneeditarray],
*   [`Doc::viewattr()`][viewattr].

<!-- links -->
[docvue]:           #core-ref:cb3e2b97-ee6d-4cdf-aa25-b2e41d0d3156
[fami18n]:          #core-ref:f5872ef4-4170-11e3-ba58-48f953959281
[attrlink]:         #core-ref:aaaa5d78-0982-4c3e-a8ed-a125c49572a8
[htmlatarget]:      http://reference.sitepoint.com/html/a/target "Définition Html <a> Href"
[odttemplate]:      #core-ref:a8c2d27a-6490-4449-9997-2984613ed219
[abstractattr]:     #core-ref:39825a45-a204-440b-ab0c-608e765eb88c
[visibility]:       #core-ref:3e67d45e-1fed-446d-82b5-ba941addc7e8
[viewattr]:         #core-ref:71bb6fe5-b094-4811-a72b-35628c5a9391
[zoneeditframe]:    #core-ref:e0a13c2a-5f9e-4274-a3d3-b3fc530cb204
[zoneeditarray]:    #core-ref:b8d2bfd5-6f42-4104-965b-c714e784b10b