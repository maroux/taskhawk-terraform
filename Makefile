.PHONY: test

test_setup:
	./scripts/test-setup.sh

test: test_setup
	./scripts/run-tests.sh
