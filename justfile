home := env_var("HOME")

openscad_lib_dir := if os() == "macos" {
  home / "Documents/OpenSCAD/libraries"
} else {
  home / ".local/share/OpenSCAD/libraries"
}

default: install-bosl2

install-bosl2:
  rm -rf /tmp/BOSL2.tar.gz {{openscad_lib_dir}}/BOSL2-master {{openscad_lib_dir}}/BOSL2
  wget -O /tmp/BOSL2.tar.gz https://github.com/revarbat/BOSL2/archive/refs/heads/master.tar.gz 2>/dev/null
  mkdir -p {{openscad_lib_dir}}
  tar -xvf /tmp/BOSL2.tar.gz -C {{openscad_lib_dir}} 2>/dev/null
  mv {{openscad_lib_dir}}/BOSL2-master {{openscad_lib_dir}}/BOSL2

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
