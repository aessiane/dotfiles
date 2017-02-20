#!/bin/sh

# A script that create a tarbal with all the folders and files specified
# in $FOLDERS, and upload them on a given server.

cd

REMOTE_USER="abel@zob.ninja"
REMOTE_BACKUP_FILE="~/backup.tar"
SSH_KEY_FILE="~/.ssh/id_rsa"

FOLDERS=(
'.config/bspwm'
'.config/dconf'
'.config/dunst'
'.config/fish'
'.config/polybar'
'.config/omf'
'.config/terminator'
'.config/peda'
'.config/sxhkd'
'.config/rofi'
'.config/termite'
'.vimrc'
'.vim/plugged/vim-snippets'
'/etc/profile'
'.emacs'
'.emacs.d'
'.scripts'
'.wallpapers'
);


BACKUP_DIR="/tmp/backup"

rm -rf "$BACKUP_DIR"
mkdir "$BACKUP_DIR"

for i in ${FOLDERS[@]}
do
  echo "Copying '$i'"
  cp -rf "$i" "$BACKUP_DIR"
done

tar -cvf "$BACKUP_DIR"".tar" "$BACKUP_DIR"

rm -rf "$BACKUP_DIR"

scp -i $SSH_KEY_FILE "$BACKUP_DIR"".tar" $REMOTE_USER:REMOTE_BACKUP_FILE

# Will be useful one day
: '
while test -n "$PASS"
do
  c=${PASS:0:1}
c=`python << EOF
c="$c"
print(chr(ord(c) + 10))
EOF`
  TRUEPASS="$TRUEPASS$c"
  PASS=${PASS:1}
done
'
