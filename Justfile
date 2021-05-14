image := "mkdocs-local"

# Print recipes
help:
  just --list --unsorted 

# Run unit tests
coverage := "false"
test class="*":
  #!/usr/bin/env bash
  set -euxo pipefail
  coverage=$([[ {{coverage}} == "true" ]] && echo "jacocoTestReport" || echo "")
  ./gradlew test --tests '{{class}}' $coverage

# Build the docs container image
buildImage:
  docker build resources -t {{image}}

# Build the documentation
build:
  docker run --rm -v $(pwd):/docs {{image}} build

# Live reloading of the documentation
serve: buildImage build
  #!/bin/bash
  docker run --rm -it -p 8000:80 -v $(pwd)/site:/usr/share/nginx/html --name local-docs -d nginx
  trap "just clean" INT
  watchexec --exts md just build

# Cleanup the docs and target directory
clean: 
  docker rm -f local-docs
  rm -f site
  ./gradlew clean

# Create a library
create libName:
  mkdir -p libraries/{{libName}}/{steps,src,resources,test}
  cp resources/README.template.md libraries/{{libName}}/README.md
