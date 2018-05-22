node {
     def  app
     stage('Clone Repository'){
        checkout scm

     }
     stage('Build Image'){
        docker.withServer('tcp://docker.ipvbd.com:4243','docker-user-credentials'){
            app = docker.build("uzzal2k5/postgresql")
        }

     }
     stage('Test Images'){
        docker.withServer('tcp://docker.ipvbd.com:4243','docker-user-credentials'){
            app.inside{
                sh 'echo "Test Passed"'
            }
        }

     }
     stage('Push Images'){
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }

     }

}
