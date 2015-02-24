fedora-test-kitchen-docker
==========================

These images provide a foundation for testing chef cookbooks using test-kitchen
and docker.

The images use `systemd` as the entrypoint so that testing of services can
be performed.

The images are hosted at: https://quay.io/repository/getpantheon/fedora-test-kitchen

!!!!!!!!WARNING!!!!!!!!

Do not use these in production as they have a privileged user `kitchen`
with password `kitchen`!  Only use them for testing chef cookbooks with
the test-kitchen docker driver

!!!!!!!!WARNING!!!!!!!!
