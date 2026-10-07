#!/bin/bash
# ==============================================================================
# Script Name: system_info.sh
# Author: Jatin (24BCS10118)
# Description: Linux System Information Gathering Script with Interactive Input,
#              Filesystem Ops, and Process Reporting.
# ==============================================================================

# Exit on error
set -e

echo "======================================================"
echo "          SYSTEM INFORMATION GATHERING TOOL           "
echo "               Author: Jatin (24BCS10118)             "
echo "======================================================"

# 1. Variables storing system information
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")
SYS_HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)

# 2. Print Basic System Details
echo ""
echo "[+] 1. Current Date & Time : ${CURRENT_DATE}"
echo "[+] 2. Hostname             : ${SYS_HOSTNAME}"
echo "[+] 3. Current User         : ${CURRENT_USER}"

# 3. Print Disk Usage
echo ""
echo "==================== DISK USAGE (df -h) ===================="
df -h
echo "============================================================"

# 4. Interactive user input using read -p
echo ""
read -p "Enter destination directory name to store process reports: " TARGET_DIR
read -p "Enter filename for saving running processes list (e.g., processes.txt): " TARGET_FILE

# 5. Create Directory using mkdir
if [ ! -d "${TARGET_DIR}" ]; then
    echo "[*] Directory '${TARGET_DIR}' does not exist. Creating it now..."
    mkdir -p "${TARGET_DIR}"
    echo "[✓] Directory '${TARGET_DIR}' created successfully."
else
    echo "[!] Directory '${TARGET_DIR}' already exists."
fi

TARGET_PATH="${TARGET_DIR}/${TARGET_FILE}"

# 6. Create File using touch
echo "[*] Creating file '${TARGET_PATH}'..."
touch "${TARGET_PATH}"

# 7. Print Running Processes to Console
echo ""
echo "=================== TOP RUNNING PROCESSES ==================="
ps aux --sort=-%mem | head -n 15
echo "============================================================"

# 8. Store Running Processes Information in the file using '>' Output Redirection
echo "[*] Writing current process snapshot to '${TARGET_PATH}'..."
echo "Report Generated On: ${CURRENT_DATE}" > "${TARGET_PATH}"
echo "Hostname: ${SYS_HOSTNAME} | User: ${CURRENT_USER}" >> "${TARGET_PATH}"
echo "============================================================" >> "${TARGET_PATH}"
ps aux >> "${TARGET_PATH}"

echo "[✓] Process report successfully saved to: ${TARGET_PATH}"
echo ""
echo "Summary of created file:"
ls -lh "${TARGET_PATH}"
echo "Total lines stored: $(wc -l < "${TARGET_PATH}")"
echo "Script execution completed successfully!"
