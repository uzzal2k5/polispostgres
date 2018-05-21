node {
     def  app
     stage('Clone Repository'){
        checkout scm

     }
     stage('Build Image'){
        app = docker.build("uzzal2k5/postgresql")

     }
     stage('Test Images'){
        app.inside{
            sh 'echo "Test Passed"'
        }

     }
     stage('Push Images'){
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }

     }

}
