THERION CONTAINER 
=================

This is the container version for [therion project](https://github.com/therion/therion).


Usage
-----

The container build is available on [Docker Hub](https://hub.docker.com/repository/docker/matteopic/therion)

	docker run --rm -it -v "C:\mytherionproject:/opt" matteopic/therion:5.5.4 /opt/project.thconfig

GitHub Docker Action
--------------------

This action build compile a therion based project.

## Inputs

### `thconfig`

**Required** The path of thconfig file relative to the repository.

## Example usage

uses: actions/therion-container@5.5.4
with:
  thconfig: 'myproject.thconfig'
