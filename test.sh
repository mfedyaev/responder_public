#!/bin/bash

set -x
echo "### Running unit tests"
pip freeze | grep -i flask

nohup python3 responder.py > responder.log 2>&1 &

sleep 1

rm -rf test.log
for endpoint in hello healthx healthy; do
  echo "### Endpoint ${endpoint}"
  curl -s -w " %{http_code}\n"  http://127.0.0.1:8192/${endpoint} | tee -a test.log
done

sleep 1

echo "cat responder.log"
cat responder.log
echo "###"

echo "cat test.log"
cat test.log
echo "###"

echo "### Unit tests completed"

set +x

# END