pipeline {
    agent any

    triggers {
        // Scrute le dépôt GitHub toutes les 5 minutes pour détecter les changements
        pollSCM('* * * * *')  // Changez la fréquence si nécessaire
    }

    environment {
        // Variables d'environnement Docker Hub
        DOCKER_IMAGE = 'marwen77/salutation'
        DOCKER_TAG = 'latest'
        DOCKER_HUB_CREDENTIALS = 'github-credentials' // Remplacez par l'identifiant de vos credentials Docker Hub dans Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Récupérer le code du projet depuis GitHub
                git 'https://github.com/marwanbarhoumi/examen-devops.git' // Remplacez par l'URL de votre dépôt GitHub
            }
        }

        stage('Build') {
            steps {
                // Effectuer le build du projet avec Maven
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Construire l'image Docker à partir du Dockerfile
                    sh """
                    docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
                    """
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Se connecter à Docker Hub et pousser l'image générée
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                        echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                        """
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline exécuté avec succès.'
        }
        failure {
            echo 'La pipeline a échoué.'
        }
    }
}

