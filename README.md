# DossierFacile Keycloak themes

<pre>
DossierFacile.fr a été créé par le Ministère de la Transition écologique
pour aider à la réalisation de dossiers de location.

</pre>

The project is used by [DossierFacile.fr](https://dossierfacile.fr)

## Release

zip all the files `zip Dossier-Facile-Keycloak-v{tag-version}.jar -r LICENSE META-INF theme` and make a github release with the file created and the right version tag

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Usage

You need [Docker](https://www.docker.com/) and [Docker compose](https://docs.docker.com/compose/).

Clone the [DossierFacile-Keycloak project](https://github.com/MTES-MCT/Dossier-Facile-Keycloak).

Download [keycloak-franceconnect-v7.0.0.jar](https://github.com/InseeFr/Keycloak-FranceConnect/releases/download/7.0.0/keycloak-franceconnect-7.0.0.jar) and copy it inside `Dossier-Facile-Keycloak`.

Run:
```
docker-compose -f docker-compose.dev.yml up -d
```
To create a dedicated user and database 'keycloak' and to launch the keycloak service

Then go to http://localhost:8085/auth/admin/master/console/ login with the KEYCLOAK_ADMIN credentials

Create realm "dossier-facile"

Create new client "dossier-facile-api"
- select theme "df"
- in capability config, activate "client authentication"
- then go to tab "credentials" and copy the client secret

## License
[MIT](https://choosealicense.com/licenses/mit/)
