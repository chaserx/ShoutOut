require 'rubygems'
require 'bundler/setup'
require 'twilio-ruby'

module ShoutOut
  class TwilioClient
    attr_accessor :sid, :auth_token, :number

    # account_sid, auth_token, and number from your twilio account
    def initialize sid, auth_token, number
      @sid = sid
      @auth_token = auth_token
      @number = number
    end

    def send_message recipient, message_body
      @client = Twilio::REST::Client.new(@sid, @auth_token)
      @client.account.sms.messages.create(from: @number, to: recipient,
                                          body: message_body)
    end
  end
end
