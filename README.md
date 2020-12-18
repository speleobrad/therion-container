THERION CONTAINER 
=================

This is the container version for [therion project](https://github.com/therion/therion).


Usage
-----

The container build is available on [Docker Hub](https://hub.docker.com/repository/docker/matteopic/therion)

	docker run --rm -it -v "C:\mytherionproject:/opt" --workdir /opt matteopic/therion:5.5.4 project.thconfig

GitHub Docker Action
--------------------

This action build compile a therion based project.

## Inputs

### `thconfig`

**Required** The path of thconfig file relative to the repository.

## Example usage

    steps:
      - name: Build with therion
        uses: actions/therion-container@5.5.4
        with:
          thconfig: 'myproject.thconfig'