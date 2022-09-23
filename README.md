# Arizona Quickstart Scaffolding

![Security workflow](https://github.com/az-digital/az-quickstart-scaffolding/workflows/Security%20workflow/badge.svg)

- Designed to build a Quickstart website/project codebase
- Includes [Quickstart](https://github.com/az-digital/az_quickstart) as dependency
- Installs Drupal in a `web` subdirectory
- Utilizes [composer-installers](https://github.com/composer/installers) and [Drupal Composer Scaffold](https://github.com/drupal/core-composer-scaffold) plugins
- Can be used as project template for composer [create-project command](https://getcomposer.org/doc/03-cli.md#create-project):
  ```
  composer create-project az-digital/az-quickstart-scaffolding:2.5.x-dev azqs --no-interaction --no-dev
  ```


# Migration setup in Lando

Arizona Digital has added a [README for migrating into Quickstart 2](https://github.com/az-digital/az_quickstart/blob/main/modules/custom/az_migration/README.md).

# Updating Quickstart

Currently, Arizona Digital supports the two most recent [minor releases of Arizona Quickstart](https://github.com/az-digital/az_quickstart/blob/main/RELEASES.md).

- `composer install` will install updates and pull in dev dependencies, and also apply patches if they exist.
- `composer install  --no-dev` will install updates, and will remove dev dependencies, and also apply patches if they exist.
- `composer update` is supposed to get the latest available based on the [version constraints](https://getcomposer.org/doc/articles/versions.md#summary) in your composer.json file, and also apply patches if they exist.
- `composer require "az-digital/az_quickstart:2.5.0" --update-no-dev` Will pin to a specific version of Quickstart without dev dependencies. You can update your site, incrementing the version number whenever you want to update, or use version constraints with `composer update --no-dev` to only update to a tagged version.

Once your site's codebase is up to date, it is important to run database updates and distribution updates.

**Important** Always create a backup before running database updates or importing distribution updates.

Updating the database can be done via the command line:
```
drush updatedb
```
**Important** Always ensure your site is set on the correct strategy for importing distribution updates.
For Quickstart, it is recommended to use the merge strategy when importing distribution updates, which can be set via drush, or within the Admin UI.

It is advisable that you familiarize yourself with the functionality of the [Config Distro](https://www.drupal.org/project/config_distro) module to get the most out of Quickstart.

```
drush -y state:set config_sync.update_mode 1 --input-format=integer
```
Importing distribution updates can be done via the command line:
```
drush config-distro-update
```

# Launching your site

When you are ready to launch your site, you can remove dev dependencies included with Quickstart and this scaffolding repository with composer, but first you will want to make sure the development modules are not enabled in Drupal.

Example
```
drush pm:uninstall -y devel migrate_devel config_inspector
```

Once uninstalled, dev dependencies can safely be removed with composer.
```
composer remove --dev
```
