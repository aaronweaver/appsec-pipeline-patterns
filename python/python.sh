## ZAP Docker
docker run -d --name zap --link dojo -p 127.0.0.1:8080:8080 -i owasp/zap2docker-stable zap.sh -daemon -host 0.0.0.0 -port 8080 -config api.disablekey=true
docker ps -a

## Selenium and ZAP requirements
pip install selenium==2.53.6
pip install requests
pip install python-owasp-zap-v2.4
pip install prettytable
pip install bandit

## Source CLR
curl -sSL https://download.sourceclear.com/ci.sh | bash

## Run Bandit python static code
bandit -r * -x venv,tests,ansible

## Docker Bench for Security
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
sh docker-bench-security.sh

## Run Selenium and ZAP Scan
python tests/check_status.py -v
python tests/smoke_test.py
python tests/zap.py
