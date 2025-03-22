tag_repository = "kkdt.github.io/ubi8-ansible"
tag_version = "8.10-1"

# The build will use the specified Containerfile
packer_build_sources = ["source.docker.file"]

# The Containerfile relative location
container_file = "containers/ubi8-ansible/Containerfile"

# Container tar filename
container_tar_filename = "ubi8-ansible.tar"