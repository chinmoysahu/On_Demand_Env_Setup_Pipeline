pipeline{
  agent any
  stages{
    stage('terraform init'){
      steps{
        sh "echo Hello - 1!!"
      }
    }
    stage('Provision Ansible and K8s Management Servers'){
      steps{
        sh "echo Hello - 2!!"
      }
    }
    stage('Create K8s Cluster'){
      steps{
        sh "echo Hello - 3!!"
      }
    }
    stage('Pull Latest Code and Push to Image Repository - DockerHub'){
      steps{
        sh "echo Hello - 4!!"
      }
    }
    stage('Pull Image and Deploy on K8s Cluster'){
      steps{
        sh "echo Hello - 5!!"
      }
    }
    stage('Sanity Test Deployed Application'){
      steps{
        sh "echo Hello - 6!!"
      }
    }
    stage('Bring Down Application and Delete Cluster'){
      steps{
        sh "echo Hello - 7!!"
      }
    }
    stage('Destroy Terrform Resources'){
      steps{
        sh "echo Hello - 8!!"
      }
    }
  }

}
