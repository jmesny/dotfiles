#!/bin/bash

echo "#!/bin/bash"

for directory in $(ls -d -1 ${WS}/**); do
    if [[ -d "${directory}/.git" ]]; then
        cd ${directory}
        remote=$(git remote get-url --all origin)
        reponame=$(basename `git rev-parse --show-toplevel`)
        echo "git clone ${remote} ${reponame}"
    fi
done