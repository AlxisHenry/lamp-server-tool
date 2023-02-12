#!/bin/bash

#- This script will prepare code in dist folder for laravel project
#- ================================================================

# Install dependencies
# --------------------
# @param {string} $1
# @return {void}
dependencies () {
	rm -rf vendor/ node_modules/;
	if [ "$1" == "--production" ]; then
		composer install --no-dev --optimize-autoloader && npm install --omit=dev;
  elif [ "$1" == "--development" ]; then
		#- All dependencies are needed for build process
		composer install && npm install;
  fi
}

# Laravel configuration 
# ---------------------
# @return {void}
configuration () {
	# Generate app key
	key=$(php artisan key:generate --show);
	sed -i "s/APP_KEY=.*/APP_KEY=$key/g" .env.example;
	# Configure environment
	sed -i "s/APP_ENV=.*/APP_ENV=production/g" .env.example;
	sed -i "s/APP_DEBUG=.*/APP_DEBUG=false/g" .env.example;
}

# Laravel clear storage 
# ---------------------
# @return {void}
storage () {
	# Clearing cached files
	php artisan optimize:clear;
	# Delete session files
	rm -f storage/framework/sessions/*;
}

# Laravel Optimization
#
# https://laravel.com/docs/9.x/deployment#optimization
# ----------------------------------------------------
# @return {void}
optimization () {
	# Optimizing Configuration Loading
	php artisan config:cache
	# Optimizing Route Loading
	php artisan route:cache
	# Optimizing View Loading
	php artisan view:cache
}

# Build assets
# -------------
# @return {void}
build () {
	npm run build;
}

# Clean useless folders/files
# ---------------------------
# @return {void}
clean () {
	# Folders
	folders="resources/js resources/scss";
	for folder in $folders; do
		rm -rf $folder;
	done
	# Files
	files=".editorconfig postcss.config.js tailwind.config.js vite.config.js package.json package-lock.json webpack.mix.js composer.lock phpstan.neon phpstan .phpunit.result.cache";
	for file in $files; do
		rm -f $file;
	done
	# Scripts
	extensions="sh gitignore md bat env";
	for extension in $extensions; do
		find -iname "*.$extension" -not -path "./vendor/*" -delete
	done
}

# Call functions
# --------------
# @return {void}
main () {
	dependencies --development;
	configuration;
	storage;
	optimization;
	build;
	dependencies --production;
	clean;
}