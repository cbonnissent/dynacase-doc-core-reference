# `DYNACASE_FAVICO` {#core-ref:9ffaeb64-eb77-4c10-ab37-ae5113781778}

## Description {#core-ref:deecfcf1-2df0-4310-974d-9b8f1cf92cca}

Le paramètre `DYNACASE_FAVICO` permet de spécifier l'icone qui est présentée
par les pages HTML de Dynacase.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `CORE/Images/dynacase.ico`
*   Utilisateur : Non

## Valeur {#core-ref:f1a51bd1-4554-4e74-b67e-9516ae297d51}

La valeur est un chemin d'accès à un fichier au format [favicon
`.ico`][favicon_ico_format]. Le chemin d'accès est relatif à l'URL d'accès à
l'index de Dynacase (e.g. `CORE/Images/dynacase.ico`).

## Notes {#core-ref:7736f4b2-8533-420d-993e-69453367b66a}

Exemple d'utilisation de l'icône dans une vue HTML :

    <!--STYLESHEETS-->
    <link rel="icon" href="[DYNACASE_FAVICO]"/>
    <link rel="shortcut icon" href="[DYNACASE_FAVICO]"/>

<!-- links -->
[favicon_ico_format]: https://en.wikipedia.org/wiki/ICO_(file_format)