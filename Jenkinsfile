pipeline {
    agent {
        label 'AGENT-1'
    }
    options{
        disableConcurrentBuilds()
        timeout(time:10, unit: 'MINUTES')
    }
    environment{
        appVersion = ''
    }

    stages {
        stage('Read the Version') {
            steps {
               script{      //script means groovy scripts
                def packageJson = readJSON file: 'package.json'
                appVersion = packageJson.version
                echo 'App version:${appVersion}'
               }
            }
        }
        // stage{
        //     steps{
        //         sh """
        //         sudo dnf module disable nodejs -y
        //         sudo dnf module enable nodejs:20 -y
        //         sudo dnf install nodejs -y
        //         """
        //     }
        // }
        // stage('Install dependencies') {
        //     steps {
        //        sh 'npm install'
        //     }
        // }
        // stage('Build docker image') {
        //     steps {                         //dot means current directory
        //         sh """
        //         docker build -t kdprasad028/backend:${appVersion} .
        //         docker images
        //         """
        //     }
        // }
    }
    post {
        always{
            echo "This is ALWAYS section, always say hello"
            deleteDir()
        }

        success{
            echo "This section print when pipeline is success, I am SUCCESS"
        }

        failure{
            echo "this section failed when pipeline is FAILED. I am FAIL"
        }
    }
}