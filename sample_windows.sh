#!/usr/bin/env bash

### Set Parameter ###
# 1. Point to the path of your KPScript.exe -> Mostly here C:\Programs\Keepass2\KPScript.exe
# 2. Point to the path of your Database.kdbx -> Like C:\Users\whoami\Database.kdbx
# 3. Use your Master Key as encrypted Password -> Like AVUVLa97bR31M3O+w6....J3r!KW3L0v3U....d+80jur8UADjHQ=
# 4. Use the Title of your Entry

path_kpscript_exe=<KPSCRIPT_EXE> #1
path_database=<DATABASE_KDBX> #2
password_encrypted=<ENCRYPTED_PASSWORD> #3
title=<TITLE> #4
function get_credential(){
cred=$(${path_kpscript_exe} \
        -c:GetEntryString ${path_database}  \
        -pw-enc:${password_encrypted} \
        -Field:${1} \
        -ref-Title:${title})
cred=$(echo $cred | sed 's/\s*OK\:.*//g')
}
get_credential "UserName"
echo ${cred}

get_credential "Password"
echo ${cred}