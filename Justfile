image := "mkdocs-local"

serve:
  docker build resources -t {{image}}
  docker run --rm -it -p 8000:8000 -v ${PWD}:/docs {{image}}

create libName:
  mkdir -p libraries/{{libName}}/{steps,src,resources}
  cp resources/README.template.md libraries/{{libName}}/README.md
