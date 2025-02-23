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

5. Execute container
    ```
    podman run -it --rm kkdt.github.io/redhat:8.10-1 /bin/bash
    ```

6. The proof-of-concept should install `local-info` as a function and there should be the users `root` and `kkdt`

7. Isolation - All tools and configurations are installed locally to the cloned project in the `build` directory
    - Packer, `build/.packer`
    - Ansible, `build/.ansible-galaxy`

## Build with different pkrvars

Build using the same Packer script but pass in different pkrvars.

```
packer build -var-file=pkrvars/app1srv/app1srv.pkrvars.hcl containers/redhat/.
```

The command above will build a different container image identified by the custom pkrvars file.


[//]: Links

[packer-docker-builder]: https://developer.hashicorp.com/packer/integrations/hashicorp/docker/latest/components/builder/docker
[packer-configurations]: https://developer.hashicorp.com/packer/docs/configure
[packer-releases]: https://releases.hashicorp.com/packer/
[packer-plugins-directory]: https://developer.hashicorp.com/packer/docs/plugins
[packer-docker-ansible]: https://alex.dzyoba.com/blog/packer-for-docker/
