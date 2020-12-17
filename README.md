THERION CONTAINER 
=================

This is the container version for [therion project](https://github.com/therion/therion).


Usage
-----

	docker run --rm -it -v "C:\mytherionproject:/opt" matteopic/therion:5.5.3 /opt/project.
	
docker action
-------------

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `thconfig`

**Required** The path of thconfig file relative to the repository.

## Example usage

uses: actions/therion-container@v1
with:
  thconfig: 'myproject.thconfig'
