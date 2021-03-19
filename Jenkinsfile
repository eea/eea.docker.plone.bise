pipeline {
  environment {
    registry = "eeacms/bise-backend"
    template = "templates/bise-backend"
    dockerImage = ''
    tagName = ''
  }

  agent any

  stages {
    stage('Release') {
      when {
        buildingTag()
      }
      steps{
        node(label: 'docker') {
          script {
            withCredentials([string(credentialsId: 'eea-jenkins-token', variable: 'GITHUB_TOKEN')]) {
            
             //remove starting v from version if it exists
             def version = "${BRANCH_NAME}" - ~/^v/
             sh '''docker pull eeacms/gitflow; docker run -i --rm --name="${BUILD_TAG}-release" -e GIT_TOKEN="${GITHUB_TOKEN}" -e RANCHER_CATALOG_PATH="${template}" -e DOCKER_IMAGEVERSION="${BRANCH_NAME}" -e RANCHER_CATALOG_VERSION="${version}" -e DOCKER_IMAGENAME="${BRANCH_NAME}" --entrypoint /add_rancher_catalog_entry.sh eeacms/gitflow'''
         
            }
          }
        }
      }
    }

  }

  post {
    changed {
      script {
        def url = "${env.BUILD_URL}/display/redirect"
        def status = currentBuild.currentResult
        def subject = "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
        def summary = "${subject} (${url})"
        def details = """<h1>${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - ${status}</h1>
                         <p>Check console output at <a href="${url}">${env.JOB_BASE_NAME} - #${env.BUILD_NUMBER}</a></p>
                      """

        def color = '#FFFF00'
        if (status == 'SUCCESS') {
          color = '#00FF00'
        } else if (status == 'FAILURE') {
          color = '#FF0000'
        }
        emailext (subject: '$DEFAULT_SUBJECT', to: '$DEFAULT_RECIPIENTS', body: details)
      }
    }
  }
}
