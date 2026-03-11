pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-install-deps') {
            steps {
                script{
                    build()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                script{
                    deploy("DEV")
                }
            }
        }
        stage('test-dev') {
            steps {
                script{
                    deploy("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                script{
                    deploy("STG")
                }
            }
        }
        stage('test-stg') {
            steps {
                script{
                    deploy("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                script{
                    deploy("PROD")
                }
            }
        }
        stage('test-prd') {
            steps {
                script{
                    deploy("PROD")
                }
            }
        }
    }
}

def build() {
    echo "Installing all necessary node dependencies.."
}

def deploy(String environment) {
    echo "Deployment to ${environment} environment has started.."
    echo "Deployment to ${environment} environment finished.."
}

def deploy(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    echo "Testing Sample Book Application service finished.."
}