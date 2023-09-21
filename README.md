# Arizona Quickstart Scaffolding

## Notes
If you are planning on pushing this site to Pantheon, you should use the
[Pantheon upstream repository](https://github.com/az-digital/az-quickstart-pantheon) as your scaffolding repo,
which has separate instructions.

![Security workflow](https://github.com/az-digital/az-quickstart-scaffolding/workflows/Security%20workflow/badge.svg)

- Designed to build a Quickstart website/project codebase
- Includes [Quickstart](https://github.com/az-digital/az_quickstart) as dependency
- Installs Drupal in a `web` subdirectory
- Utilizes [composer-installers](https://github.com/composer/installers) and [Drupal Composer Scaffold](https://github.com/drupal/core-composer-scaffold) plugins
- Can be used as project template for composer [create-project command](https://getcomposer.org/doc/03-cli.md#create-project):

## Choosing the Right Branch for Your Quickstart Project
In the Arizona Quickstart Scaffolding project, different branches serve various
purposes. Here's a guide to understanding which branch you should choose:

### Main Branch (`dev-main`)

- **Purpose**: The main branch contains all the latest features and changes. It
  represents the cutting-edge development and may be less stable than specific
  release branches. You can use it with `dev-main` or an alias for the latest
  unreleased version (e.g., `2.8.x`).
- **When to Use**: Choose this branch if you want access to the very latest
  features, and you are willing to work with potentially less-tested code. Ideal
  for development, experimentation, or testing unreleased functionality.

### Release Branches (e.g., `2.5.x`, `2.6.x`, `2.7.x`)

- **Purpose**: Release branches, named in the format of `2.x.x-dev`, are created
  for specific versions of the project and are considered stable and
  production-ready. They contain well-tested features suitable for live
  environments.
- **When to Use**: Select one of the latest two supported release branches
  (e.g., `2.7.x-dev`, `2.6.x-dev`) if you need a stable version of the project
  for production use, have specific environment constraints, or want to maintain
  compatibility with particular third-party modules or a specific release.
- **Note**: Only the latest two release branches are actively supported. Using
  one of these ensures that you receive updates, security patches, and support
  aligned with your system's requirements, avoiding potential conflicts and
  achieving a robust and reliable implementation.
- **Version Constraints in Supported Release Branches**: Each supported release
  branch in this repository specifies a version constraint for az_quickstart in composer.json.
  This constraint ensures that the release branch will work with compatible
  versions of Quickstart that correspond to the compatible minor release branch,
  providing flexibility while maintaining alignment with the intended versions.

### Feature or Issue Branches

Feature or issue branches in this repository are typically created to make
updates to the scaffolding to work with specific branches of
`az-digital/az_quickstart`. When creating such a branch, it is customary to pin
this repository's composer.json reference for `az-digital/az_quickstart` to a
specific issue/feature branch that the changes are intended to work with. This
ensures that the branch's changes align precisely with a particular state of the
Quickstart project.

These branches are useful for isolated development, testing of changes, or adding new features to the scaffolding that correspond to developments in the Quickstart project.

**Notes**
- If developing a feature for `az-digital/az_quickstart`, use the provided build tools (DDev or Lando) instead of running `composer create-project` directly.
- These branches are not as stable as the main or release branches, so use
  them for development, experimentation, or testing rather than in production
  environments.
- The use of feature or issue branches in this repository is tightly aligned
  with developments in the az-digital/az_quickstart project, and they should be
  used in conjunction with the corresponding Quickstart branches.

### Using the `composer create-project` command:

With Composer's `create-project` command, you can quickly scaffold a new project
using the Arizona Quickstart Scaffolding. Each `az-quickstart-scaffolding`
branch coincides with an `az_quickstart` branch, ensuring compatibility and
alignment between the scaffolding and the core project.


Here are some examples of how you might use this command with different branch
specifications:

If using any of the following commands, adjust `my_project_name` to your desired
project directory name.

- **Using the Main Branch (`main`) with dev dependencies**:
   ```bash
   composer create-project az-digital/az-quickstart-scaffolding:dev-main my_project_name --no-interaction --no-dev

- **Using the Latest Unreleased Version Alias (`2.8.x`):**

   ```bash
   composer create-project az-digital/az-quickstart-scaffolding:2.8.x-dev my_project_name --no-interaction --no-dev
   ```

- **Using a Specific Release Branch (e.g., `2.7.x`):**
  ```bash
  composer create-project az-digital/az-quickstart-scaffolding:2.7.x-dev my_project_name --no-interaction --no-dev
  ```

- **Using an Issue or Feature Branch (e.g., `issue-45`)**

  ```bash
  composer create-project az-digital/az-quickstart-scaffolding:dev-issue/45 my_project_name --no-interaction
  ```

## Migration setup in Lando

Arizona Digital has added a [README for migrating into Quickstart 2](https://github.com/az-digital/az_quickstart/blob/main/modules/custom/az_migration/README.md).


## Updating Quickstart

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
