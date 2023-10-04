pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git credentialsId: 'githubcred', url: 'https://github.com/datorresr/movie-analyst-api'
            }
        }

        stage('Install NPM DEV') {
            steps {
                // Install Mocha globally
                sh 'npm install --save-dev'
                //sh 'node server.js &'
                sleep 10  // Adjust as needed                
            }
        }

        stage('Testing') {
            steps {
                        // Install Mocha globally if not already installed

                dir('/var/lib/jenkins/workspace/MoviesBackEnd') {
                    // Install Mocha locally within your project directory
                    sh 'npm install mocha --save-dev'
                    // Run your Mocha tests
                    sh 'npm test'
                    //sh '/var/lib/jenkins/.nvm/versions/node/v18.12.1/bin/mocha ./test/test.js'
                }
                    
                
                
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