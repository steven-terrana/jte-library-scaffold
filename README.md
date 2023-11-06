# Home

This repository serves as a scaffold to jumpstart a new set of libraries for the [Jenkins Templating Engine (JTE)](https://jenkinsci.github.io/templating-engine-plugin).

It comes with some best practices baked in to help you get off on the right foot with JTE.

## Features

| Feature              | Description                                                                                          |
|----------------------|------------------------------------------------------------------------------------------------------|
| Documentation        | Generate a MkDocs site to document libraries                                                         |
| Unit Tests           | Integrated with [Jenkins Spock](https://github.com/ExpediaGroup/jenkins-spock) for testing libraries |
| Release Automation   | Automates publishing new versions via the Justfile                                                   |
| Automated Changelogs | Integrates [Release Drafter](https://github.com/release-drafter/release-drafter)                     |

## Documentation

This repository uses [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) as the documentation framework.

| Component                   | Description                                                                                                                                                                                        |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Landing Page                | By default, the `README.md` at the root of this repository will become the landing page for the documentation. This behavior is overridden if there is an `index.md` file in the `docs` directory. |
| Contributing Page           | If present, the `CONTRIBUTING.md` is transformed into a `Contributing` page in the documentation site                                                                                              |
| Library Documentation       | Each library should have a `README.md` that gets compiled into the documentation                                                                                                                   |
| Miscellaneous Documentation | Any non-library specific documentation can be placed in the `docs` directory.                                                                                                                      |

These transformations happen by utilizing the `gen-files` plugin for MkDocs.
The `resources/copy_docs.py` script performs the repository transformations for the documentation.

## Unit Tests

Unit tests can be written using [Jenkins Spock](https://github.com/ExpediaGroup/jenkins-spock).

These tests should go in the `test` directory for each library.

## Packaging as a Plugin

Run `./gradlew jte` to package the libraries as a stand alone plugin.

## Release Automation

To cut a new release, run:

``` bash
just release $version
```

Which will:

1. create a `release/$version` branch
2. create a `$version` tag
3. publish the documentation for the version and upate the `latest` documentation alias

## Automated Changelogs

[Release Drafter](https://github.com/release-drafter/release-drafter) is used to automate release note updates as Pull Requests are opened to `main`. 

The configuration for Release Drafter exists in the `.github/release-drafter.yml` file and uses GitHub Actions. 
