.PHONY: tests
tests: # Run application tests
	@bash app.sh --tests;

.PHONY: config
config: # Configure application
	@bash app.sh --config;