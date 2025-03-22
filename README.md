# packer-infrastructure

## Objectives

1. Provide an *isolated* Packer environment where all the tooling configurations and runtime 
  are not stored anywhere on the host system, see [bashrc](bashrc).
    - Packer, `build/.packer` and `build/bin`
    - Ansible, `build/.ansible-galaxy`
    - Local Ansible roles/collections are commit with this project as examples, i.e. `sample.local-functions`

2. Leverage [Packer Docker Builder][packer-docker-builder] and Packer Ansible Provisioner to share 
  existing infrastructure-as-code provided by common Ansible playbooks, roles, and collections.

3. Leverage the Packer Ansible Plugin to executes Ansible directly on the contianer

4. Packer required plugins for all Packer builds are declared in a single file to initialize the 
  environment, see [requirements.pkr.hcl]

## Quick Start

1. Build the isolated Packer environment
    ```
    source bashrc
    local-build
    which packer
    packer --version
    ```

2. Build the container image for Ansible "local" mode
    ```
    packer build -var-file=containers/ubi8-ansible/build.pkrvars.hcl packer/docker/.
    ```

3. List the image
    ```
    podman images
    ```

4. Execute container
    ```
    podman run -it --rm kkdt.github.io/ubi8-ansible:8.10-1 /bin/bash
    ```

5. The proof-of-concept should install `local-info` as a function and there should be the users `root` and `kkdt`

6. Clean up the build area
    ```
    local-clean
    ```


[//]: Links

[packer-docker-builder]: https://developer.hashicorp.com/packer/integrations/hashicorp/docker/latest/components/builder/docker
[packer-configurations]: https://developer.hashicorp.com/packer/docs/configure
[packer-releases]: https://releases.hashicorp.com/packer/
[packer-plugins-directory]: https://developer.hashicorp.com/packer/docs/plugins
[packer-docker-ansible]: https://alex.dzyoba.com/blog/packer-for-docker/
