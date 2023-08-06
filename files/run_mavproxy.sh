#!/usr/bin/env bash

set -e

# LOG_NAME=$(date "+%Y%m%d_%H%M%S_mavproxy")
# LOG_FILE_NAME="${LOG_NAME}.log"
# LOG_DIR="/var/log/mavproxy/"

# cd ${LOG_DIR}
# mkdir ${LOG_NAME}
# cd ${LOG_NAME}

# mavproxy.py --logfile=${LOG_FILE_NAME} ${@}
mavproxy.py ${@}