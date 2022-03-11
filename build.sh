#!/bin/bash
echo "### Running build"
set -x
echo "python --version"
python --version

echo "pip --version"
pip --version

echo "pip freeze | grep -e 'flask\|quart\|waitress\|pylint\|pytest'"
pip freeze | grep -i -e 'flask' -e 'quart' -e 'waitress' -e 'pylint' -e 'pytest'

echo "apt list pylint"
apt list pylint

set +x
echo "### Build completed"

# END
