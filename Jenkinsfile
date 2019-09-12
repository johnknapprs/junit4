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
        NEXUS_ADMIN_USERNAME = 'admin'
        NEXUS_ADMIN_PASSWORD = 'admin123'
    }
    stages {
        stage('Build') {
            steps {
                sh('./mvnw clean install')            }
        }
        stage('Deploy') {
            when {
                expression {
                    return params.DEPLOY_NEXUS_BUILD
                }
            }
            steps {
                sh('./mvnw -s ./settings.xml clean deploy')

                build(
                    job: 'spring.petclinic.app.pipeline',
                    parameters: [
                        booleanParam(name: 'DEPLOY_JUNIT_UPDATE',
                        value: true)
                    ]
                )

            }
        }
    }
}
