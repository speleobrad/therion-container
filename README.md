Therion Container
=================

This is the docker container version for [therion](https://github.com/therion/therion) project.

Run with Docker
---------------

The container build is available on [Docker Hub](https://hub.docker.com/repository/docker/matteopic/therion).
To use it, just mount your project dir in any container path (the example below uses `/opt`) and pass the `.thconfig` file as usual.

	docker run --rm -it -v "C:\mytherionproject:/opt" --workdir /opt matteopic/therion:5.5.4 project.thconfig

Run with GitHub
---------------

You can use the action to let the github compile and release the project for you.

## Inputs

### `thconfig`

**Required** The path of thconfig file relative to the repository.

## Example usage

Use following step snippet for the `.github/workflows/main.yml` file.

    steps:
      - name: Build with therion
        uses: matteopic/therion-container@5.5.4
        with:
          thconfig: 'myproject.thconfig'

For a full working example look at this project  [buco del bagno](https://github.com/matteopic/buco-del-bagno/blob/master/.github/workflows/main.yml),
when a push occurs the project is compiled and a release is created, then the resulting pdf and lox files are included.

[Here the result](https://github.com/matteopic/buco-del-bagno/releases/tag/1.0.0)
