tag_repository = "kkdt.github.io/ubi8-cui"
tag_version = "8.10-1"

# The build will use the specified Containerfile
packer_build_sources = ["source.docker.image"]

# Uses the one built by this project (need it installed locally)
container_image = "kkdt.github.io/ubi8-ansible:8.10-1"

# Container tar filename
container_tar_filename = "ubi8-cui.tar"

build_playbook = "containers/ubi8-cui/playbook.yml"

# Assume that container_image is already installed locally
pull = false

build_ansible_verbose = "-v"