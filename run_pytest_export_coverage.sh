#! /bin/bash
ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.132.2.39 << EOF

docker exec cne_flask_frontend pytest tests/test_frontend.py --cov application >> frontend_test_coverage.html

docker exec cne_flask_backend pytest tests/test_backend.py --cov application >> backend_test_coverage.html

EOF