default: install-bosl

install-bosl:
  #! /bin/bash
  OPENSCAD_LIB_DIR="$HOME/.local/share/OpenSCAD/libraries"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    OPENSCAD_LIB_DIR="$HOME/Documents/OpenSCAD/libraries"
  fi

  wget -O /tmp/BOSL.tar.gz https://github.com/revarbat/BOSL/archive/refs/tags/v1.0.3.tar.gz
  mkdir -p "$OPENSCAD_LIB_DIR"
  tar -xvf /tmp/BOSL.tar.gz -C "$OPENSCAD_LIB_DIR"
  mv "$OPENSCAD_LIB_DIR/BOSL-1.0.3" "$OPENSCAD_LIB_DIR/BOSL"

@xvfb-openscad +args:
  docker run --init --rm \
    -v "$(pwd):/openscad" \
    openscad/openscad \
    xvfb-run -a openscad --hardwarnings {{args}}

@openscad +args:
  docker run --rm \
    -v "$(pwd):/openscad" \
    openscad/openscad \
    openscad --hardwarnings {{args}}

preview *args: (preview-squaredrop args) (preview-teardrop args)

build *args: (build-squaredrop args) (build-teardrop args)

preview-squaredrop *args:
  just xvfb-openscad \
    ./src/squaredrop/squaredrop.scad \
    -o ./dist/squaredrop.png \
    -p ./src/squaredrop/squaredrop.json \
    --camera=-10,-25,345,80,0,225,6900 \
    --imgsize 2650,1440 \
    {{args}}

preview-teardrop *args:
  just xvfb-openscad \
    ./src/teardrop/teardrop.scad \
    -o ./dist/teardrop.png \
    -p ./src/teardrop/teardrop.json \
    --camera=-10,-25,345,80,0,225,6900 \
    --imgsize 2650,1440 \
    {{args}}

build-squaredrop *args:
  just openscad \
    ./src/squaredrop/squaredrop.scad \
    -o ./dist/squaredrop.stl \
    {{args}}

build-teardrop *args:
  just openscad \
    ./src/teardrop/teardrop.scad \
    -o ./dist/teardrop.stl \
    {{args}}
