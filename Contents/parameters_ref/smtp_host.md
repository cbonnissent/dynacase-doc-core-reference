# `SMTP_HOST` {#core-ref:7fae21a9-00d4-47f9-88e7-2400f1893a52}

## Description {#core-ref:14e76237-5013-4c3e-8f9e-b0a9dd90f2fd}

Le paramètre `SMTP_HOST` permet de spécifier le serveur SMTP utilisé par
Dynacase pour l'envoi de courriels.

*   App : `FDL`
*   Portée : Global
*   Valeur initiale : `localhost`
*   Utilisateur : Non

## Valeur {#core-ref:f1e21d5a-4e9d-4bad-a427-d19c2fee824d}

La valeur peut être une adresse IP (e.g. `192.168.0.1`) ou un nom d'hôte (e.g.
`mail.example.net`).

Si aucune valeur n'est spécifiée, alors le nom d'hôte `localhost` est utilisé.

## Notes {#core-ref:af477312-b123-40c3-8709-661c01970e38}

L'adresse IP, ou le nom d'hôte, peut être préfixé par `ssl://` afin d'indiquer
l'établissement d'une connexion sécurisée par SSL/TLS (e.g. `ssl://192.168.0.1`,
`ssl://mail.example.net`). Le port de connexion est alors spécifié via le
paramètre [`SMTP_PORT`][smtp_port].

<!-- links -->
[smtp_port]: #core-ref:5d989c49-760c-436f-8632-cc463b7d4752