#!/bin/bash

echo "#!/bin/bash"

echo "pip3 install --upgrade pip"

pip3 list --format=columns | tail -n +3 | awk '{print $1}' | while read module; do echo "pip3 install ${module}"; done
