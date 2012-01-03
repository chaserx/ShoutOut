#!/usr/bin/env ruby

# Dec 31, 2011
# New Year Shout Out
# Spam your friends' and family's phones and your twitter account with a simple ruby script
# Requirements:
# Twilio Account w/ phone number
# Twitter Account w/ Developer Credentials
# A server to host a response file incase your friends reply to the SMS bot. -> replr.php
# Uses whenever gem to schedule cron job

require "rubygems"
require "bundler/setup"

require "twilio-ruby"
require "twitter"
require "yaml"


# Twilio

# get your cred
twilio_config = YAML.load_file(File.join(File.expand_path("~"), ".twilio", "keys.yml"))

account_sid = twilio_config['account_sid']
auth_token = twilio_config['auth_token']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# an array of peeps
peeps = [
 # "+18595551212",
 "+18595520123"
]

# iterate and send an SMS to your peeps
peeps.each do |e|

@client.account.sms.messages.create(
  #:from => '+14155992671', # twilio sandbox number
  :from => '+18597953743', # my twilio number
  :to => e,
  :body => "Wishing you Peace and Prosperity in 2012\r\nAlso, HAPPY NEW YEAR!!\r\nsent by Chase\'s SMS Robot"
)

end

## Twitter

# get your twitter cred
twitter_config = YAML.load_file(File.join(File.expand_path("~"), ".twitter", "keys.yml"))

configure twitter object
Twitter.configure do |config|
  config.consumer_key = twitter_config['consumer_key']
  config.consumer_secret = twitter_config['consumer_secret']
  config.oauth_token = twitter_config['oauth_token']
  config.oauth_token_secret = twitter_config['oauth_token_secret']
end

Twitter.update("Wishing you Peace and Prosperity in 2012\r\nAlso, HAPPY NEW YEAR!!\r\n#fb")