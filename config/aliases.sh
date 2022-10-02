# This script will create script alias(es)

# =========================
# Environment variables
# =========================
source $(dirname "$0")/../.env;

# =========================
# .bashrc configuration
# =========================
create () {
	alias maintaining="bash $APP_PATH/cciappro.sh maintaining";
}

"$@"