.PHONY: tests config

tests: # Run application tests
	@bash app.sh --tests;

config: # Configure application
	@bash app.sh --config;