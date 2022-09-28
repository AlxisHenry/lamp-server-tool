# =============================
# Apache Helper Functions
# =============================

# Restart Apache Service
apache_restart ()
{
	sudo systemctl restart apache2;
}

# Reload Apache Service
apache_reload ()
{
	sudo systemctl reload apache2;
}