# Shout Out

For those special occassions like New Years Eve when you would like to send
your friends and family an SMS and/or your maybe post to your twitter account.

## Usage

Copy credentials from dotenv.sample. `cp dotenv.sample .env`, then drop in your
actual credentials in the .env file.

Replace fake phone numbers in `shoutouts/phonenumbers` with the numbers of
actual recipients who would like to hear from you. One number per line.

Configure the location of the shoutout script you'd like to run in
`config/schedule.rb`. Run `whenever -w` from the project root to write to the
crontab to invoke script on your behalf.

## Requirements:

- Twilio Account w/ phone number configured for SMS/MMS
- Twitter Account w/ Developer Credentials
- A server to host a response file incase your friends reply to the SMS bot. -> replr.php

