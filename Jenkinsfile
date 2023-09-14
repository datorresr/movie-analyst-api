pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git credentialsId: 'githubcred', url: 'https://github.com/datorresr/movie-analyst-api'
            }
        }

        stage('Install Mocha Globally') {
            steps {
                // Install Mocha globally
                sh 'npm install -g mocha'
            }
        }

        stage('Testing') {
            steps {
                        // Install Mocha globally if not already installed

                sh 'npm install --save-dev'
                sh 'node server.js &'
                sleep 10  // Adjust as needed

                // Run your Mocha tests
                sh 'mocha test/test.js'
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