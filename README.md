# docker-cim-compiler
[![Build Status](https://travis-ci.org/JavierGelatti/docker-cim-compiler.svg?branch=master)](https://travis-ci.org/JavierGelatti/docker-cim-compiler)

Docker image that contains the Cim compiler for the Simula programming language.
To be able to use it, you need to have Docker installed.

## Usage
To execute a simula program you can use the `run_simula` script, that uses the image [available in Docker Hub](https://hub.docker.com/r/javiergelatti/simula/).
For example, to execute the `example_program.sim` file, run:

```
./run_simula example_program.sim
```

## Building the image from source
If you want to build the image yourself, run `docker build -t simula docker_image/`.

Then, to execute a simula file, for example stored in `/home/my_file.sim`, run:
```
docker run -v /home/my_file.sim:/simula/program.sim --rm -it javiergelatti/simula run_simula
```

## More information
Image in Docker Hub: https://hub.docker.com/r/javiergelatti/simula/

About the Cim compiler: http://folk.uio.no/simula67/cim.shtml, https://www.gnu.org/software//gawk/cim.wait/cim.html

About Simula: https://wikipedia.org/wiki/Simula, http://tedfelix.com/software/simula.html
