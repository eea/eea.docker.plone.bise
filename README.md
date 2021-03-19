# Quick links for BISE website:

- Orchestration: https://github.com/eea/eea.docker.plone.bise#branch=volto-plone5
- Demo website: https://demo-bise.eea.europa.eu
- New Volto-based frontend: https://github.com/eea/bise-frontend
- Taskman project: https://taskman.eionet.europa.eu/projects/biodiversity

## Releases

#### frontend (Volto)

The frontend service docker image is automatically created when tagging this repo: https://github.com/eea/bise-frontend The docker image is updated here: https://github.com/eea/eea.rancher.catalog/tree/master/templates/volto-bise and here: https://ci.eionet.europa.eu/view/Github/job/volto/job/bise-frontend/view/tags/. Docker image will be pushed here: https://hub.docker.com/r/eeacms/bise-backend/

#### backend (Plone)

Create a tag in this repo, it will build the Docker image. Docker image will be pushed here: https://hub.docker.com/r/eeacms/eea.docker.plone.bise/ 

## Quickstart for development

Welcome to your new stack. Run ``make help`` to see what you can do.

Ideally you will run ``make setup-fullstack-dev`` then ``make start-plone``,
create a new Plone site and activate eea.restapi product. Then run ``make
volto-shell``. Inside the frontend container run ``yarn start`` to start Volto.

### Setting up for backend developers
- Run ``make setup-backend-dev``

### Setting up for frontend developers
Run ```make setup-frontend-dev``
