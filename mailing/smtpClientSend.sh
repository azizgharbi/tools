#!/usr/bin/expect

set SMTP_SERVER 		      "[lindex $argv 0]"
set SMTP_PORT 			      "[lindex $argv 1]"
set AUTHENTICATION_CODE   "[lindex $argv 2]"
set FROM 				          "[lindex $argv 3]"
set TO 					          "[lindex $argv 4]"
set SUBJECT               "[lindex $argv 5]"
set BODY 				          "[lindex $argv 6]"
set IS_HTML				        "[lindex $argv 7]"

set timeout 10

spawn openssl s_client -connect $SMTP_SERVER:$SMTP_PORT -crlf -ign_eof 

expect "220" {
  send "EHLO localhost\n"

  expect "250" {
    send "AUTH PLAIN $AUTHENTICATION_CODE\n"

    expect "235" {
      send "MAIL FROM: <$FROM>\n"

      expect "250" {
        send "RCPT TO: <$TO>\n"

        expect "250" {
          send "DATA\n"

		  send "From: $FROM <$FROM>"
		  send "To: $FROM <$FROM>"

          expect "354" {
            send "Subject: $SUBJECT\n"

            # FOR HTML BODY
      			#send "Mime-Version: 1.0;\n"
      			#send "Content-Type: text/html; charset=\"ISO-8859-1\";\n"
      			#send "Content-Transfer-Encoding: 7bit;\n"
      			#send "\n"
      			#send "<html>\n"
      			#send "<body>\n"
      			#send "<h2>An important link to look at!</h2>\n"
      			#send "Here's an <a href=\"http://www.codestore.net\">important link</a>\n"
      			#send "</body>\n"
      			#send "</html>\n"

            # FOR TEXT BODY
            send "$BODY\n"

            send "\n.\n"

            expect "250" {
                send "quit\n"
            }
          }
        }
      }
    }
  }
}