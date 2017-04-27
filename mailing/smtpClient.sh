#!/bin/bash

echo -n "Smtp server: "
read SMTP_SERVER

echo -n "Smtp port: "
read SMTP_PORT

echo -n "Email: "
read EMAIL

echo -n "Password: "
read -s PASSWORD
echo ""

echo -n "Subject: "
read SUBJECT

echo $SUBJECT

echo -n "Body (Accept file): "
read BODY

if [[ -f $BODY ]]; then
    BODY=$(<$BODY)
fi

echo -n "Is html: "
read IS_HTML

AUTHENTICATION_CODE=$(echo -ne "\0$EMAIL\0$PASSWORD" | base64)

#echo -ne "\0$EMAIL\0$PASSWORD" | base64

exec ./smtpClientSend.sh $SMTP_SERVER $SMTP_PORT $AUTHENTICATION_CODE $EMAIL $EMAIL "$SUBJECT" "$BODY" "$IS_HTML"

