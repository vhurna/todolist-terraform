#!/bin/bash
set -e

apt-get update -yq
apt-get install -yq python3-pip git unzip

TMP_DIR="/tmp/todo-src"
rm -rf "$TMP_DIR"
git clone https://github.com/vhurna/devops_todolist_terraform_task.git "$TMP_DIR"

rm -rf /app && mkdir -p /app
cp -r "$TMP_DIR"/app/* /app

cp "$TMP_DIR"/app/todoapp.service /etc/systemd/system/
cp "$TMP_DIR"/app/start.sh       /app/
chmod +x /app/start.sh

systemctl daemon-reload
systemctl enable todoapp.service
systemctl start  todoapp.service
