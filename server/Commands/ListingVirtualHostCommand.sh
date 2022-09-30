# =========================
# Listing V. Hosts Command
# =========================

ListingVirtualHostCommand ()
{	
	FunctionStarterHelper;
	SelectedOptionHelper "Liste des différents virtuals hosts";
	vhost_directory="/etc/apache2/sites-available";
	ls -l $vhost_directory;
	ReturnToMenuHelper;
}