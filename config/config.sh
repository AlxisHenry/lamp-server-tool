# This script will configure .bashrc to launch the program when a new shell is created.

# =========================
# Environment variables
# =========================
source $(dirname "$0")/../.env;

# =========================
# .bashrc configuration
# =========================
bashrc () {
	file_path="/home/$USER/.bashrc";
	command="\nbash $APP_PATH/cciappro.sh maintaining";
	echo -e $command >> $file_path;
}

"$@"