pipeline{
  agent any
  environment {
   PATH = "${PATH}:${getTerraformPath()}"
}
  stages{
    stage('terraform init'){
      steps{
        def build = currentBuild.rawBuild
        def cause = build.getCause(hudson.model.Cause.UserIdCause.class)
        def name = cause.getUserName()
        sh "echo ${name}"
        createS3Bucket("terraform-backend-ondmd-${name}")
      }
    }
    stage('Provision Ansible and K8s Management Servers'){
      steps{
        sh "echo Hello - 2!!"
        sh "terraform init"
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
    stage('Destroy Terraform Resources'){
      steps{
        sh "echo Hello - 8!!"
      }
    }
  }

}


def getTerraformPath(){
  def tfHome = tool name: 'Terraform-0.12', type: 'terraform'
  return tfHome
}

def createS3Bucket(bucketName){
  sh returnStatus: true, script:"aws s3 mb ${bucketName} --region=us-east-1"
}
