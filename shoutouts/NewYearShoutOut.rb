#!/usr/bin/env ruby

# Dec 31, 2011 (last updated Dec 31, 2015)
# New Year Shout Out
# Spam your friends' and family's phones and your twitter account with a simple ruby script
# Requirements:
# Twilio Account w/ phone number
# Twitter Account w/ Developer Credentials
# A server to host a response file incase your friends reply to the SMS bot. -> replr.php
# Uses whenever gem to schedule cron job

require 'rubygems'
require 'bundler/setup'
require 'dotenv'
# require 'twitter'
require_relative '../lib/twilio_client'

Dotenv.load

# Send New Years SMSes with Twilio

new_years_message = <<-END.gsub(/^ {22}/, '')
                      Wishing you Peace and Prosperity in 2015

                      Also, HAPPY NEW YEAR!!

                      sent by Chase\'s SMS Robot
                    END

# Iterate and send an SMS to your peeps
File.readlines(File.join(File.dirname(__FILE__), 'phonenumbers')).each do |number|
  client = ShoutOut::TwilioClient.new(ENV['SID'], ENV['AUTH_TOKEN'], ENV['NUMBER'])
  client.send_message(number, new_years_message)
  puts "Sent message to #{number}"
end

###################################

# Send New Years message with Twitter

# #configure twitter client
# Twitter.configure do |config|
#   config.consumer_key = ENV['CONSUMER_KEY']
#   config.consumer_secret = ENV['CONSUMER_SECRET']
#   config.oauth_token = ENV['OAUTH_TOKEN']
#   config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
# end

# Twitter.update("Wishing you Peace and Prosperity in 2015\r\nAlso, HAPPY NEW YEAR!!\r\n#fb")
