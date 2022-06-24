FROM eeacms/plone-backend

RUN runDeps="vim tmux mc" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $runDeps \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY sources.ini requirements.txt constraints.txt /app/
RUN pwd
RUN bin/mxdev -c sources.ini \
  && pip install -r requirements.txt -c constraints.txt ${PIP_PARAMS} \
  && find /app -not -user plone -exec chown plone:plone {} \+

# COPY docker-setup.sh /
# RUN /docker-setup.sh

# && pip install --upgrade pip \
