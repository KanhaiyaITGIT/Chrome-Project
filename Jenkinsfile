pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages {
        stage('git checkout') {
            echo "git repo checking out"
            git url: "https://github.com/KanhaiyaITGIT/Chrome-Project.git", branch: "main"
            echo "git repo cloneed successfully"
        }
        stage('code build') {
            steps {
                echo "building code"
                sh "mvn clean package -Dmaven.test.skip=true"
                echo "code built successfully"
            }
        }
        stage('code test') {
            steps {
                echo "code testing starting...."
                sh "mvn test"
                echo "code tested"
            }
        }
        stage('code report genrate') {
            steps {
                echo "report generating"
                sh "mvn surefire-report:report"
                echo "report generated successfully"
            }
        }
        stage('sonarqube analysis') {
            environment {
                sonarHome = tool 'sonar-scanner-server'
            }
            steps {
                echo "sonarqube analysis...."
                withSonarQubeEnv('sonar-server') {
                    withCredentials([string(credentialsId: "sonar-credentials", variable: "SONAR_TOKEN")]) {
                        sh "${sonarHome}/bin/scanner -Dsonar.login=$SONAR_TOKEN"
                    }
                }
                echo "sonarqube analysis completed"
            }
        }
        stage('quality gate') {
            steps {
                timeout(time: 4, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline:false
                }
            }
        }
    }
    post {
        success {
            echo "Hey ! Your Pipeline Ran successfully"
            echo "Hurrah !!!"
        }
        failure {
            echo "Yaar maza ni aya failed hogya bhai 🙃🙃😒😒"
        }
    }

}

