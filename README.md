# Quick links for BISE website:

- Orchestration: https://github.com/eea/eea.docker.plone.bise#branch=volto-plone5
- Demo website: https://demo-bise.eea.europa.eu
- New Volto-based frontend: https://github.com/eea/bise-frontend
- Taskman project: https://taskman.eionet.europa.eu/projects/biodiversity

## Quickstart for development

Welcome to your new stack. Run ``make help`` to see what you can do.

Ideally you will run ``make setup-fullstack-dev`` then ``make start-plone``,
create a new Plone site and activate eea.restapi product. Then run ``make
volto-shell``. Inside the frontend container run ``yarn start`` to start Volto.

### Setting up for backend developers
- Run ``make setup-backend-dev``

### Setting up for frontend developers
Run ```make setup-frontend-dev``
