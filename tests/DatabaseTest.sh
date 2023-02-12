#!/bin/bash

DB_NAME="test_create_database";

function testDatabaseCredentialsAreValid() {
	mysql -u ${DB_USERNAME} -p${DB_PASSWORD} -e "exit" > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database credentials are not valid" true;
	else
		success "✅ Database credentials are valid" true;
	fi
}

function testDatabaseCanBeCreated() {
	mysql -u ${DB_USERNAME} -p${DB_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}" > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database cannot be created" false;
	else
		success "✅ Database can be created" false;
	fi
}

function testDatabaseCanBeUsed() {
	mysql -u ${DB_USERNAME} -p${DB_PASSWORD} -e "USE ${DB_NAME}" > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database cannot be used" false;
	else
		success "✅ Database can be used" false;
	fi
}

function testDatabaseCanBeDumped() {
	mysqldump -u ${DB_USERNAME} -p${DB_PASSWORD} ${DB_NAME} > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database cannot be dumped" false;
	else
		success "✅ Database can be dumped" false;
	fi
}

function testDatabaseCanBeImported() {
	mysql -u ${DB_USERNAME} -p${DB_PASSWORD} ${DB_NAME} < /dev/null > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database cannot be imported" false;
	else
		success "✅ Database can be imported" false;
	fi
}

function testDatabaseCanBeDeleted() {
	mysql -u ${DB_USERNAME} -p${DB_PASSWORD} -e "DROP DATABASE IF EXISTS ${DB_NAME}" > /dev/null 2>&1;
	if [[ $? -ne 0 ]]; then
		warning "⚠️ Database cannot be deleted" false;
	else
		success "✅ Database can be deleted" false;
	fi
}

function tests() {
	testDatabaseCredentialsAreValid;
	testDatabaseCanBeCreated;
	testDatabaseCanBeUsed;
	testDatabaseCanBeDumped;
	testDatabaseCanBeImported;
	testDatabaseCanBeDeleted;
	echo -e "";
}

tests;