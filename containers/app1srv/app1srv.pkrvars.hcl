tag_repository = "kkdt.github.io/app1srv"
tag_version = "0.1"

# The build will use the specified Containerfile
packer_build_sources = ["source.docker.file"]

# The Containerfile relative location
container_file = "containers/app1srv/Containerfile"

# The Ansible playbook for app1srv
build_playbook = "containers/app1srv/app1srv.yml"

# Delete the container image after docker-save
keep_input_artifact = false

# Container tar filename
container_tar_filename = "app1srv.tar"