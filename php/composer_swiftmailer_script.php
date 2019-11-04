#!/usr/bin/env php

<?php
require_once './vendor/autoload.php';

// Create the Transport
$transport = (new Swift_SmtpTransport('email-smtp.us-east-1.amazonaws.com', 465, 'tls'))
  ->setUsername('$_ENV["SMTP_USERNAME"]')
  ->setPassword('$_ENV["SMTP_PASSWORD"]')
;

// Create the Mailer using your created Transport
$mailer = new Swift_Mailer($transport);

// Create a message
// Edit Subject
$message = (new Swift_Message('Name Subject'))
// 'From' can be any 'username'@clipstock.com
  ->setFrom(['From_Username@domain.com' => 'Name of Sender'])
// 'To' first needs to be verified at AWS SES Management console under
// 'Identity Management', 'Email Addresses'
  ->setTo(['To_Username@domain' => 'Name of Recipient'])
  ->setBody('This is a test email to see if php script uses "swift" mailer to send an email');

// Send the message
$transport = $mailer->send($message);

// Script to receive sent status
// Script will get two email messages
if (!$mailer->send($message, $failures)) {
  echo "Failures:";
  print_r($failures);
} else {
    echo 'email sent successfully';
}