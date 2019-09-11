# Getting Started

### Create a Jenkins Job to publish JUnit4
1. Select [New Item](http://192.168.33.10:8080/view/all/newJob) option on Jenkins homepage
2. Enter the name "spring.petclinic.junit.pipeline" and select the "Pipeline" job type
3. Select definition "Pipeline script from SCM"
4. Enter the url of your forked JUnit4 repository
5. Enable "GitHub hook trigger for GITScm polling" to receive push events
6. Copy [demo_build/Jenkinsfile](demo_build/Jenkinsfile) to project's root directory
4. Copy [demo_build/pom.xml](demo_build/pom.xml) to project's root directory (to update Nexus address to localhost)
7. Commit and push changes
8. Save and Run

### Deploy Version 4.15-SNAPSHOT for Spring-PetClinic
1. Copy [demo_deploy/Jenkinsfile](demo_deploy/Jenkinsfile) to project's root directory
2. Copy [demo_deploy/settings.xml](demo_deploy/settings.xml) to project's root directory
3. Commit and push changes, wait for job to trigger
