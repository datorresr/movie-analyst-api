pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git credentialsId: 'githubcred', url: 'https://github.com/datorresr/movie-analyst-api'
            }
        }



        stage('Testing') {
            steps {
                        // Install Mocha globally if not already installed
                sh 'whoami'
                //sh 'sudo npm install -g mocha'

                    // Run your Mocha tests
                sh 'mocha ./test/test.js'
            }
        }



        stage('Install Dependencies and Deploy to EC2') {
            steps {
                // SSH into your EC2 instance and run npm install
                sh '''
					/usr/bin/chmod +x ./script/deploy
					./script/deploy
                '''
            }
        }

    }
}