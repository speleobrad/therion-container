![Docker Image Version](https://img.shields.io/docker/v/matteopic/therion)
[![GitHub marketplace](https://img.shields.io/badge/marketplace-compile--with--therion-blue?logo=github&style=flat-square)](https://github.com/marketplace/actions/compile-with-therion)

Therion Container
=================

This is the docker container version for [therion](https://github.com/therion/therion) project.

Init submodules
---------------
After you have cloned this repository you need to launch following commands

  git submodule --init
  git submodule update

Run with Docker
---------------

The container build is available on [Docker Hub](https://hub.docker.com/repository/docker/matteopic/therion).
To use it, just mount your project dir in any container path (the example below uses `/opt`) and pass the `.thconfig` file as usual.

	docker run --rm -it -v "C:\mytherionproject:/opt" --workdir /opt matteopic/therion:6.2.1-slavic project.thconfig

GitHub Action
-------------

You can use the action to let the github compile and release the project for you.

## Example usage

Use following step snippet for the `.github/workflows/main.yml` file.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Build with therion
        uses: matteopic/therion-container@6.2.1-slavic
        with:
          thconfig: 'myproject.thconfig'
```

## Customizing

### inputs

The following inputs can be used as `step.with` keys:

| Name                         | Type     | Default            |Description                                                                                                  |
|------------------------------|----------|--------------------|-------------------------------------------------------------------------------------------------------------|
| `thconfig`                   | String   |                    | Therion config file used for the build. Path is relative to repository root. (Required)                     |

**Required** The path of thconfig file relative to the repository.

For a full working example look  at [grotta del fiume](https://matteopic.github.io/grotta-del-fiume/) project.
When a push occurs therion project is compiled and resulting PDF, LOX files are published in a github hosted website.
[Here the github workflow](https://github.com/matteopic/grotta-del-fiume/blob/master/.github/workflows/build-site.yml)
