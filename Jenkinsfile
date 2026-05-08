pipeline {
    agent any

    tools {
        jdk 'jdk-17'
        nodejs 'node16'
    }

    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage('Git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/nrjydv1997/bingo-dev-sec-ops-project.git'
            }
        }
        
        stage('Sonar analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=bingo-dev-sec-ops-project -Dsonar.projectKey=Bingo '''
                }
            }
        }
        
        stage('Quality gate') {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
                }
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        
        stage('OWASP FS SCAN') {
            steps {
                echo "OWASP FS SCAN"
               // dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP'
               // dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        
        stage('Docker Build and Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker') {
                        sh "docker build -t bingo-dev-sec-ops-project ."
                        sh "docker tag bingo-dev-sec-ops-project nrjydv1997/bingo-dev-sec-ops-project:latest"
                        sh "docker push nrjydv1997/bingo-dev-sec-ops-project:latest"
                    }
                }
            }
        }
        
        stage('Trivy Image Scan') {
            steps {
                sh "trivy image nrjydv1997/bingo-dev-sec-ops-project:latest > trivyimage.txt"
            }
        }
        
        stage('Deploy to Container') {
            steps {
                sh 'docker run -d --name bingo -p 3000:3000 nrjydv1997/bingo-dev-sec-ops-project:latest'
            }
        }
        
    }
    
    post {
        always {
            script {
                def buildStatus = currentBuild.currentResult
                def buildUser = currentBuild.getBuildCauses('hudson.model.Cause$UserIdCause')[0]?.userId ?: 'Github User'
                
                emailext (
                    subject: "Pipeline ${buildStatus}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                    body: """
                        <p>This is a java-maven-app CICD pipeline status.</p>
                        <p>Project: ${env.JOB_NAME}</p>
                        <p>Build Number: ${env.BUILD_NUMBER}</p>
                        <p>Build Status: ${buildStatus}</p>
                        <p>Started by: ${buildUser}</p>
                        <p>Build URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                    """,
                    to: 'nrjydv1997@gmail.com',
                    from: 'nrjydv1997@gmail.com',
                    replyTo: 'nrjydv1997@gmail.com',
                    mimeType: 'text/html',
                    attachmentsPattern: 'trivyfs.txt,trivyimage.txt'
                )
            }
        }
    }
    
}
