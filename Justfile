image := "mkdocs-local"

buildImage:
  docker build resources -t {{image}}

build:
  docker run --rm -v $(pwd):/docs {{image}} build

serve: buildImage build
  #!/bin/bash
  docker run --rm -it -p 8000:80 -v $(pwd)/site:/usr/share/nginx/html --name local-docs -d nginx
  trap "just cleanup" INT
  watchexec --exts md just build

cleanup: 
  docker rm -f local-docs
  rm -f site

create libName:
  mkdir -p libraries/{{libName}}/{steps,src,resources}
  cp resources/README.template.md libraries/{{libName}}/README.md
