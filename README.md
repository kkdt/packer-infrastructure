# packer-infrastructure

## Objectives

1. Provide an *isolated* Packer environment where all the tooling configurations and runtime 
  are not stored anywhere on the host system, see [bashrc](bashrc).

2. Leverage [Packer Docker Builder][packer-docker-builder] and Packer Ansible Provisioner to share 
  existing infrastructure-as-code provided by common Ansible playbooks, roles, and collections.

## Quick Start

1. Download and configure packer within the project
    ```
    source bashrc
    local-download-packer
    env | grep PACKER
    packer --version
    ```

2. Initialize the packer environment
    ```
    packer init containers/redhat/.
    ```

3. Build the container image
    ```
    packer build containers/redhat/.
    ```

4. List the image
    ```
    podman images
    ```

[//]: Links

[packer-docker-builder]: https://developer.hashicorp.com/packer/integrations/hashicorp/docker/latest/components/builder/docker
[packer-configurations]: https://developer.hashicorp.com/packer/docs/configure
[packer-releases]: https://releases.hashicorp.com/packer/
[packer-plugins-directory]: https://developer.hashicorp.com/packer/docs/plugins
[packer-docker-ansible]: https://alex.dzyoba.com/blog/packer-for-docker/
