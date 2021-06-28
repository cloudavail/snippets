#!/usr/bin/env python3

import smtplib, ssl

smtp_server = "email-smtp.us-east-1.amazonaws.com"
port = 587  # For starttls
sender_email = ""
password = ""

sender = 'test@cloudavail.com'
receivers = ['test@cloudavail.com']

message = """From: Colin Johnson <test@cloudavail.com>
To: Colin Johnson <test@cloudavail.com>
Subject: SMTP e-mail test with New Credentials

This is a test e-mail message.
"""

# Create a secure SSL context
# context = ssl.create_default_context()

# Try to log in to server and send email
try:
    server = smtplib.SMTP(smtp_server,port)
    server.ehlo() # Can be omitted
    server.starttls() # Secure the connection
    server.ehlo() # Can be omitted
    server.login(sender_email, password)
    server.sendmail(sender, receivers, message)
    # TODO: Send email here
except Exception as e:
    # Print any error messages to stdout
    print(e)
finally:
    server.quit() 
