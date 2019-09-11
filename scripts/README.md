# Getting Started

### Create a Jenkins Job to publish JUnit4
1. Select [New Item](http://192.168.33.10:8080/view/all/newJob) option on Jenkins homepage
2. Enter the name "spring.petclinic.junit.pipeline" and select the "Pipeline" job type
3. Select definition "Pipeline script from SCM"
4. Enter the url of your forked spring-petclinic repository
5. Enable "GitHub hook trigger for GITScm polling" to receive push events
6. Copy [demo_build/Jenkinsfile](demo_build/Jenkinsfile) to project's root directory
7. Commit and push changes
8. Save and Run
