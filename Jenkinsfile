// pipeline {
//     agent any

//     stages {
//         stage('SCM') {
//             steps {
//                 checkout scm
//             }
//         }
        
//         stage('SonarQube Analysis') {
//             steps {
//                 script {
//                   def mvn = tool 'M3'
//                   withSonarQubeEnv() {
//                     sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
//                   }
//               }
//           }
//       }
//   }
// }
pipeline {
    agent any
        
    environment {
        // Define environment variables if needed
        DOCKERHUB_CREDENTIALS = "dockerhub"
        DOCKER_IMAGE = "over1lord/finalimg"
    }
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
        

    stages {
        stage ('Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main',
                    url: 'https://github.com/OVER1LORD/DEVOPS-final-project.git'
            }
        }
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Install') {
            steps {
                sh "mvn install"
            }
        }
        stage ('Deploy') {
            steps {
                echo "Deploying"
                deploy adapters: [tomcat9 (
                    credentialsId: 'tomcat',
                    path: '',
                    url: 'http://172.174.237.187:8088/'
                )],
                contextPath: 'DEVOPS-final-Project',
                onFailure: 'false',
                war: '**/*.war'
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.war'
                }
            }
        }
            
            
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    sh 'docker build -t finalimg .'
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {
                        // Push the Docker image to Docker Hub
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}

