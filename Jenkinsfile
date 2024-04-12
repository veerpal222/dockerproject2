pipeline {
    agent any

    stages {
        stage('Fetching code from Git') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/veerpal222/dockerproject2.git'
            }
        }
        stage('Copy code from jenkins to ansible') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'scp -r  /var/lib/jenkins/workspace/game/*  root@13.49.137.66:/root/data', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage('Building docker image') {
            steps {
                echo sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd /root/data
docker build . -t sanjay9888/$JOB_NAME:$BUILD_ID
docker tag sanjay9888/$JOB_NAME:$BUILD_ID sanjay9888/$JOB_NAME:latest
docker push sanjay9888/$JOB_NAME:$BUILD_ID 
docker push sanjay9888/$JOB_NAME:latest ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage('Running conatiner on docker machine by use of ansible') {
            steps {
               sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd /root/project1
ansible-playbook play.yml''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        
    }
}
