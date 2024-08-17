## Elasticsearch

This is a repo achieves two things -

- A preconfigured elasticsearch.yml

    In this config file we disable nmap as Elasticsearch requires `vm.max_map_count` to be set to `262144` when the default is `65530`.

    This is needed because changing `vm.max_map_count` Would not be possible on most cloud hosted providers.

- Chmod's the /esdata directory with the `elasticsearch` user.

    The volumes are mounted as root but elasticsearch is ran as non-root.

    This is needed because elasticsearch needs to write to the volume.