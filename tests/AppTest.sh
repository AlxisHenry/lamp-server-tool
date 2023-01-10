#!/bin/bash

function testSpecifiedApplicationsAreInstalled() {
	echo -e "";	
	for APP in ${APPS}
	do
		version="VERSION_${APP}";
		if [ "${!version}" == "null" ]; then
			warning "⚠️ The version of the application '${APP}' cannot be determined.";
		else
			success "✅ The application '${APP}' is installed and the version is [${!version}].";
		fi
	done;
	echo -e "";
}

function tests() {
	testSpecifiedApplicationsAreInstalled;
}

tests;