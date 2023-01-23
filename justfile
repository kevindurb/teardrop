@openscad args="":
  docker run --rm -v "$(pwd):/openscad" openscad/openscad xvfb-run -a openscad "{{args}}"
