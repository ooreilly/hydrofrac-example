FROM docker.io/library/ubuntu:latest as builder

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update
FROM builder as builder2
## Install make
RUN apt-get install -y make

## Install a fortran compiler
RUN apt-get install -y gfortran
# Install mpi
RUN apt-get install -y libopenmpi-dev

FROM builder2 as builder3
# Install git
RUN apt-get install -y git
# Install Lapack
RUN apt-get install -y libblas-dev liblapack-dev
RUN apt-get install -y libopenblas-dev
# Install octave
RUN apt-get install -y octave


# Install and compile FDMAP
FROM builder3 as builder4
RUN git clone https://bitbucket.org/ericmdunham/fdmap.git
ADD make make
RUN cp make/Makefile.ubuntu fdmap/
RUN cd fdmap && make -f Makefile.ubuntu 

# Run prepare to run simulation
FROM builder4 as builder5
ADD hydrofrac hydrofrac
RUN mkdir simulation && cp -r hydrofrac/* simulation/
RUN cd simulation && ln -fs ../fdmap/fdmap fdmap 
