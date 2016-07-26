./packages:
	virtualenv packages
	. packages/bin/activate && pip install -r requirements.txt

$(HOME)/.aws/credentials:
	. packages/bin/activate && aws configure

dependencies: ./packages
credentials: $(HOME)/.aws/credentials

run: dependencies credentials
	-. packages/bin/activate && ./keepalive-test
