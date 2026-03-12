pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    stages {
        stage('build-install-deps') {
            steps {
                script{
                    buildApp()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                script{
                    deploy("DEV", 1010)
                }
            }
        }
        stage('test-dev') {
            steps {
                script{
                    test("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                script{
                    deploy("STG", 2020)
                }
            }
        }
        stage('test-stg') {
            steps {
                script{
                    test("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                script{
                    deploy("PROD", 3030)
                }
            }
        }
        stage('test-prd') {
            steps {
                script{
                    test("PROD")
                }
            }
        }
    }
}

def buildApp() {
    echo "Installing all necessary node dependencies.."
    pwsh "npm install"
}

def deploy(String environment, int port) {
    echo "Deployment to ${environment} environment has started.."
    pwsh "ls"
    bat "pm2 start -n \"books-${environment}\" index.js -- -- ${port}"
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    echo "Testing Sample Book Application service finished.."
}