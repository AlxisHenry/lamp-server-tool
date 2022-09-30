# =============================
# Logs functions Helper
# =============================

# @param string $1: type
# @param string $2: value
newLog ()
{
	log_file="LOG_${1^^}"
	echo -e "[: $SERVER_SYSTEM - $SERVER_NAME :]" $2 >> ${!log_file};
}