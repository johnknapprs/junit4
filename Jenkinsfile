pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'DEPLOY_NEXUS_BUILD',
            defaultValue: true,
            description: 'Deploy artifacts to nexus'
        ) 
    }
    environment {
        // Nexus credentials accessed in project settings.xml
        NEXUS_ADMIN_USERNAME = credentials('NEXUS_ADMIN_USERNAME')
        NEXUS_ADMIN_PASSWORD = credentials('NEXUS_ADMIN_PASSWORD')
    }
    stages {
        stage('Update pom.xml remote host address') {
            steps {
                sh('/usr/bin/ruby ./scripts/update_pom_address.rb localhost')
            }
        }
        stage('Build') {
            steps {
                sh('./mvnw clean install')            }
        }
        stage('Deploy') {
            steps {
                when {
                    expression {
                        return params.DEPLOY_NEXUS_BUILD
                    }
                }
                sh('./mvnw -s ./settings.xml clean deploy')
                
                build(
                    job: 'spring.petclinic.app.pipeline',
                    parameters: [
                        string(name: 'DEPLOY_JUNIT_UPDATE',
                        value: true)
                    ]
                )

            }
        }
    }
}