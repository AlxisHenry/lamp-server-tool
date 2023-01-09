#!/bin/bash

function wait() {
  for i in {1..3}; do
    sleep 0.3;
    echo -n ".";
  done
  echo -e "";
}

function throw() {
	if [[ "${2}" == "true" ]]; then
		echo -e "";
	fi
	echo -e "\033[0;31mError\033[0m: ${1}...\n";
	exit 1;
}

function warning() {
	if [[ -z ${1} ]]; then
		throw "call to warn function but no message provided";
	fi
	if [[ "${2}" == "true" ]]; then
		echo -e "";
	fi
	echo -e "\033[0;33mWarning\033[0m: ${1}";
}

function success () {
	if [[ -z ${1} ]]; then
		throw "call to success function but no message provided";
	fi
	if [[ "${2}" == "true" ]]; then
		echo -e "";
	fi
	echo -e "\033[0;32mSuccess\033[0m: ${1}";
}

function details () {
	if [[ -z ${1} ]]; then
		throw "call to info function but no message provided";
	fi
	if [[ "${2}" == "true" ]]; then
		echo -e "";
	fi
	echo -e "\033[0;94mDetails\033[0m: ${1}";
}

function debug () {
	if [[ -z ${1} ]]; then
		throw "call to debug function but no message provided";
	fi
	if [[ "${2}" == "true" ]]; then
		echo -e "";
	fi
	echo -e "\033[0;91mDebug\033[0m: ${1}";
}