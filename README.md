# packer-infrastructure

## Objectives

1. Provide an *isolated* Packer environment where all the tooling configurations and runtime 
  are not stored anywhere on the host system, see [bashrc](bashrc).

2. Leverage [Packer Docker Builder][packer-docker-builder] and Packer Ansible Provisioner to share 
  existing infrastructure-as-code provided by common Ansible playbooks, roles, and collections.

3. Packer required plugins for all Packer builds are declared in a single file to initialize the 
  environment, see [requirements.pkr.hcl]

## Quick Start

1. Build the isolated Packer environment
    ```
    source buildrc
    local-build
    which packer
    packer --version
    ```

2. Build the container image
    ```
    packer build scripts/.
    ```

3. List the image
    ```
    podman images
    ```

4. Execute container
    ```
    podman run -it --rm kkdt.github.io/redhat:8.10-1 /bin/bash
    ```

5. The proof-of-concept should install `local-info` as a function and there should be the users `root` and `kkdt`

6. Isolation - All tools and configurations are installed locally to the cloned project in the `build` directory
    - Packer, `build/.packer` and `build/bin`
    - Ansible, `build/.ansible-galaxy`

## Build with different pkrvars

Build using the same Packer script but pass in different pkrvars.

```
packer build -var-file=containers/app1srv/app1srv.pkrvars.hcl scripts/.
```

The command above will build a different container image identified by the custom pkrvars file.


[//]: Links

[packer-docker-builder]: https://developer.hashicorp.com/packer/integrations/hashicorp/docker/latest/components/builder/docker
[packer-configurations]: https://developer.hashicorp.com/packer/docs/configure
[packer-releases]: https://releases.hashicorp.com/packer/
[packer-plugins-directory]: https://developer.hashicorp.com/packer/docs/plugins
[packer-docker-ansible]: https://alex.dzyoba.com/blog/packer-for-docker/
