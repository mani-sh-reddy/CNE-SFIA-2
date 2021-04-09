#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@3.10.171.127 << EOF

cat ~/frontend_test_coverage.html
cat ~/backend_test_coverage.html



EOF