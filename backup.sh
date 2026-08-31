#!/bin/bash

# ==========================================
# CONFIGURATION - Apni Details Yahan Bharein
# ==========================================
REPO_DIR="/path/to/your/git-repo"       # VM par GitHub repo ka path
DATA_DIR="/path/to/data/to/backup"      # Jis data ko save karna hai
BACKUP_NAME="vm-data-$(date +'%Y-%m-%d_%H-%M-%S')"

echo "=== VM Data Backup Start ==="

# 1. Repository directory mein jayein
cd $REPO_DIR || exit

# 2. Latest changes pull karein
git pull origin main

# 3. Data ko backup folder ya archive mein copy karein
# Agar direct files copy karni hain:
cp -r $DATA_DIR ./backups/$BACKUP_NAME

# 4. GitHub par commit aur push karein
git add .
git commit -m "Auto-backup VM data: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

echo "=== VM Data Successfully Saved to GitHub! ==="
