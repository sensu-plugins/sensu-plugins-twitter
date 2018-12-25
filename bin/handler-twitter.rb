#!/usr/bin/env ruby
#
# Sensu Twitter Handler
# ===
#
# This handler reports alerts to a configured twitter handler.
# Map a twitter handle to a sensusub value in the twitter.json to get going!
# sensusub == subscription in the client object, not check..
# see twitter.json for required values
#
# Copyright 2011 Joe Crim <josephcrim@gmail.com>
#
# Released under the same terms as Sensu (the MIT license); see LICENSE
# for details.

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-handler'
require 'twitter'

class TwitterHandler < Sensu::Handler
  option :verbose,
         description: 'Verbose output',
         short: '-v',
         long: '--verbose',
         boolean: true,
         default: false
  option :disable_update,
         description: 'Disable update',
         long: '--disable_update',
         boolean: true,
         default: false

  def event_name
    (@event['client']['name'] || 'unknown') + '/' + (@event['check']['name'] || 'unknown')
  end

  def handle
    puts "Settings: #{settings['twitter']}" if config[:verbose]
    puts "Event: #{@event}" if config[:verbose]
    # #YELLOW
    twitter_clients.each do |client|
      if config[:verbose]
        puts "Twitter Client: #{client}"
        puts "  Consumer Key: #{client.consumer_key}"
        puts "  Consumer Secret: #{client.consumer_secret}"
        puts "  Access Token: #{client.access_token}"
        puts "  Access Token Secret: #{client.access_token_secret}"
      end

      update_str = if @event['action'].eql?('resolve')
                     "RESOLVED - #{event_name}: #{@event['check']['notification']} Time: #{Time.now} "
                   else
                     "ALERT - #{event_name}: #{@event['check']['notification']} Time: #{Time.now} "
                   end

      if config[:disable_update]
        puts update_str
      else
        client.update(update_str)
      end
    end
  end

  private

  def twitter_clients
    @twitter_clients ||= settings['twitter'].map do |account|
      next if @event['client'].nil?
      next if @event['client']['subscriptions'].nil?
      next unless @event['client']['subscriptions'].include?(account[1]['sensusub'])

      if config[:verbose]
        puts "Account: #{account[0]}"
        puts "  Matching Subscription: #{account[1]['sensusub']}"
        puts "  Consumer Key: #{account[1]['consumer_key']}"
        puts "  Consumer Secret: #{account[1]['consumer_secret']}"
        puts "  Oauth Token: #{account[1]['oauth_token']}"
        puts "  Oauth Token Secret: #{account[1]['oauth_token_secret']}"
      end
      Twitter::REST::Client.new do |config|
        config.consumer_key = account[1]['consumer_key']
        config.consumer_secret = account[1]['consumer_secret']
        config.access_token = account[1]['oauth_token']
        config.access_token_secret = account[1]['oauth_token_secret']
      end
    end.compact
  end
end
