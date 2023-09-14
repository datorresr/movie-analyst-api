pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git credentialsId: 'githubcred', url: 'https://github.com/datorresr/movie-analyst-api'
            }
        }

        stage('Install Node.js and npm') {
            steps {
                sh '''
                    // Install nvm
                    sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

                    // Load nvm
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh"

                    // Install the desired Node.js version
                    sudo nvm install 14  // Replace with your desired Node.js version

                    // Use the installed Node.js version
                    sudo nvm use 14

                    // Verify Node.js and npm installation
                    node -v
                    npm -v
                '''

            }
        }

        stage('Testing') {
            steps {
                        // Install Mocha globally if not already installed
                sh 'sudo npm install'

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