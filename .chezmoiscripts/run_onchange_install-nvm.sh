#!/bin/bash
set -euo pipefail

echo "Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | PROFILE=/dev/null bash
