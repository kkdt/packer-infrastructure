# packer-infrastructure

## Objectives

1. Provide an *isolated* Packer environment where all the tooling configurations and runtime 
  are not stored anywhere on the host system, see [bashrc](bashrc).

## Quick Start

```
source bashrc
local-download-packer
env | grep PACKER
packer --version
```

[//]: Links

[packer-configurations]: https://developer.hashicorp.com/packer/docs/configure
[packer-releases]: https://releases.hashicorp.com/packer/
[packer-plugins-directory]: https://developer.hashicorp.com/packer/docs/plugins
