# Utilisation d'un contrôleur spécifique pour odt {#core-ref:81d5e5ab-4621-4f84-bfc3-a2e1885c3842}

Il est possible d'utiliser un contrôleur spécifique pour pouvoir mieux contrôler
ce qui est inclut dans un template, notamment en composant de nouvelles clefs ou
en ajoutant des répétables.

Les principes de fonctionnement sont décrits dans le chapitre 
[contrôle de vue des layouts][controle_consultation].

Le contrôleur spécifique peut être soit :

* dans une méthode de la classe associée pour un ODT qui est associé à un document,
* dans un fichier dans le cas d'une [zone applicative][zone_applicative].

Dans les vues de document, le [contrôleur par défaut][defautcontrol] est le même
que pour les vues standards. Les variables `[V_XXX]` sont générées pour être
utilisées dans un template `ODT`. L'argument `target` de la méthode
[`Doc::viewAttr()`][viewattr] générant ces variables doit être égale à `ooo` pour
produire des valeurs conformes à l'insertion dans un template ODT.

Exemple d'un contrôleur spécifique d'une [vue de document][docview] appelant la
création des variables associées aux valeurs d'attributs.

    [php]
    public function myOdtController($target) {
        $this->viewAttr($target); // l'argument $target sera égale à `ooo` lors de 
                                  // l'appel de cette méthode dans le cadre d'une vue
                                  // de document ODT
        $this->lay->eSet("my_key", "Hello");
    }



<!-- link -->
[controle_consultation]:     #core-ref:f239d142-608b-49a2-b273-0760e78208cf
[zone_applicative]:          #core-ref:2cd69ba4-601c-407d-ad5c-fc917bbbce02
[defautcontrol]:             #core-ref:1b7cb4c6-df1e-4124-8f5d-deaeac92561b
[viewattr]:                  #core-ref:71bb6fe5-b094-4811-a72b-35628c5a9391
[docview]:                   #core-ref:2e11bee8-ff4b-46be-b5c1-77972db7c2f9