fedora-test-kitchen-docker
==========================

[![Deprecated](https://img.shields.io/badge/Pantheon-Deprecated-yellow?logo=pantheon&color=FFDC28)](https://pantheon.io/docs/oss-support-levels#deprecated)

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

Updating Containers
--------------------

Before you are able to push to quay.io, you need to login with `docker login quay.io`, this
will authenticate you and save your creds to `~/.dockercfg`. If you do not have an account
on quay.io or access to the getpantheon org on quay.io, ask for help in the
#infrastructure channel on Slack.

- Running `build.sh` will attempt to build all versions and push them to quay.io.

- If you only want to build a specific version or versions, set the `BUILD_VERSIONS` env
variable, eg:

    BUILD_VERSIONS="19" ./build.sh

    BUILD_VERSIONS="20 22" ./build.sh
