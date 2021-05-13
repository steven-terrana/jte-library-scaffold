import org.junit.*
import spock.lang.*
import com.homeaway.devtools.jenkins.testing.JenkinsPipelineSpecification

public class BuildSpec extends JenkinsPipelineSpecification{

  def build 

  def setup() {
    build = loadPipelineScriptForTest("maven/steps/build.groovy")
  }

  def "Build step prints message" () {
    setup:
      build.getBinding().setVariable("config", [:])
    when:
      build()
    then:
      1 * getPipelineMock("sh")("echo 'build step from maven'")
  }

}