# `CORE_ALLOWGUEST`  {#core-ref:9ad61773-d7ac-41cc-b513-e98266e2923b}

## Description  {#core-ref:54f253bb-4e04-4f23-a485-d8f9cc907cd8}

Ce paramètre indique l'autorisation d'utiliser le point d'accès `guest.php` qui
permet d'accéder aux applications en tant qu'utilisateur anonyme (compte
`anonymous`) sans besoin d'authentification.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `yes`
*   Valeur possible : `yes`, `no`
*   Utilisateur : Non

## Valeur  {#core-ref:f345dba6-4cb9-4aad-85fb-68004166245b}

Si la valeur est `yes`, l'accès à `guest.php` est autorisé sinon il est
interdit. 


## Notes  {#core-ref:cd4d94df-9c32-406c-9e46-9c4b7ae3cc9f}

Un code HTTP 503 est retourné en cas d'interdiction.

<!-- links -->
