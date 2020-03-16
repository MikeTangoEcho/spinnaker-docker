FROM gcr.io/spinnaker-marketplace/halyard:stable

USER spinnaker

RUN mkdir /home/spinnaker/.hal

COPY --chown=spinnaker:spinnaker kube_config /home/spinnaker/.kube/config
COPY --chown=spinnaker:spinnaker setup.sh /home/spinnaker/setup.sh
COPY --chown=spinnaker:spinnaker connect.sh /home/spinnaker/connect.sh
