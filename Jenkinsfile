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
                    deploy("dev")
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
                    deploy("stg")
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
                    deploy("prod")
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

def deploy(String environment) {
    echo "Deployment to ${environment} environment has started.."
    pwsh "docker pull mabbler/sample-book-app:${BUILD_NUMBER}"
    pwsh "docker compose stop sample-book-app-${environment}"
    pwsh "docker compose rm sample-book-app-${environment}"
    pwsh "docker compose up -d sample-book-app-${environment}"
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    pwsh "docker pull mabbler/api-tests:latest"
    def directory = pwd()
    pwsh "echo '${directory}'"
    pwsh "docker run --rm --network sample-book-app-compose-network -v ${directory}\\test-reports\\dev:\\api-tests\\mochawesome-report mabbler/api-tests books BOOKS_${environment}"
    archiveArtifacts allowEmptyArchive: true, artifacts: 'mochawesome-report/mochawesome.json', followSymlinks: false
    pwsh "ls"
    echo "Testing Sample Book Application service finished.."
}