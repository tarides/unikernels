FROM ocurrent/opam:alpine-3.10-ocaml-4.10
RUN cd ~/opam-repository && git pull origin master && opam update
RUN opam depext -ui mirage.3.10.4
RUN mkdir -p /home/opam/src
WORKDIR /home/opam/src
COPY --chown=opam:root config.ml /home/opam/src/
ARG TARGET=unix
ARG EXTRA_FLAGS=
RUN opam config exec -- mirage configure -t $TARGET $EXTRA_FLAGS
RUN make depend
COPY --chown=opam:root . /home/opam/src
RUN opam config exec -- mirage configure -t $TARGET $EXTRA_FLAGS
RUN opam config exec -- make
RUN if [ $TARGET = hvt ]; then sudo cp resolver.$TARGET /unikernel.$TARGET; fi
