.PHONY: tests
tests: # Run application tests
	@bash maintenance.sh;

.PHONY: config
config: # Configure application
	@bash maintenance.sh --config;