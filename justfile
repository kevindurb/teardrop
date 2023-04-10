default: build preview

@xvfb-openscad +args:
  docker run --init --rm -it \
    -v "$(pwd):/openscad" \
    openscad/openscad \
    xvfb-run -a openscad --hardwarnings {{args}}

@openscad +args:
  docker run --rm -it \
    -v "$(pwd):/openscad" \
    openscad/openscad \
    openscad --hardwarnings {{args}}

preview: preview-squaredrop preview-teardrop

build: build-squaredrop build-teardrop

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
