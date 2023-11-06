void call(){
  sh "echo 'build step from maven'"
}

@Init
void something(){
  println "hi"
}

@StepAlias
void blah(){
  echo "hi"
}