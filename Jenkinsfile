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
    echo "Building sample-book-app"
    pwsh "docker build -t mabbler/sample-book-app:${BUILD_NUMBER} ."

    echo "Pushing image to docker register"
    pwsh "docker push mabbler/sample-book-app:${BUILD_NUMBER}"
}

def deploy(String environment, int port) {
//     echo "Deployment to ${environment} environment has started.."
//     git branch: 'main', poll: true, url: 'https://github.com/MartinsBilinskis/sample-book-app-2026.git'
//     pwsh "npm install"
//     pwsh "ls"
//     bat ".\\node_modules\\.bin\\pm2 delete \"books-${environment}\" || exit 0"
//     pwsh ".\\node_modules\\.bin\\pm2 start -n \"books-${environment}\" index.js -- -- ${port}"
//     echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
//     echo "Testing Sample Book Application service has started on ${environment} environment.."
//     git branch: 'main', poll: false, url: 'https://github.com/MartinsBilinskis/RTU-sample-API-automation-2026-CI-DI.git'
//     pwsh "npm install"
//     pwsh "npm run books BOOKS_${environment}"
//     echo "Testing Sample Book Application service finished.."
}