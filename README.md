# Arizona Quickstart Scaffolding

![Security workflow](https://github.com/az-digital/az-quickstart-scaffolding/workflows/Security%20workflow/badge.svg)

- Designed to build a Quickstart website/project codebase
- Includes [Quickstart](https://github.com/az-digital/az_quickstart) as dependency
- Installs Drupal in a `web` subdirectory
- Utilizes [composer-installers](https://github.com/composer/installers) and [Drupal Composer Scaffold](https://github.com/drupal/core-composer-scaffold) plugins
- Can be used as project template for composer [create-project command](https://getcomposer.org/doc/03-cli.md#create-project):
  ```
  composer create-project az-digital/az-quickstart-scaffolding:2.0.x-dev azqs --no-interaction --no-dev
  ```


# Migration setup in Lando

Arizona Digital has added a [README for migrating into Quickstart
2](https://github.com/az-digital/az_quickstart/blob/main/modules/custom/az_migration/README.md).