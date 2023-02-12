.PHONY: tests config production

tests: # Run application tests
	@bash app.sh --tests;

config: # Configure application
	@bash app.sh --config;

production: # Launch the app in production mode (skipping tests)
	@bash app.sh -m