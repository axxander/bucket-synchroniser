install-deps:
	pip3 install -U pip pip-tools setuptools
	pip-sync src/cloudfn/requirements.txt src/lambdafn/requirements.txt tests/requirements.txt
	pip3 install -e src/

update-deps:
	pip-compile src/cloudfn/requirements.in --output-file src/cloudfn/requirements.txt --upgrade
	pip-compile src/lambdafn/requirements.in --output-file src/lambdafn/requirements.txt --upgrade
	pip-compile tests/requirements.in --output-file tests/requirements.txt --upgrade
	make install-deps
