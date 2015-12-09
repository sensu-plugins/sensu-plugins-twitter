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
  def event_name
    @event['client']['name'] + '/' + @event['check']['name']
  end

  def handle
    # #YELLOW
    twitter_clients.each do |client|
      if @event['action'].eql?('resolve')
        client.update("RESOLVED - #{event_name}: #{@event['check']['notification']} Time: #{Time.now} ")
      else
        client.update("ALERT - #{event_name}: #{@event['check']['notification']} Time: #{Time.now} ")
      end
    end
  end

  private

  def twitter_clients
    @twitter_clients ||= settings['twitter'].map do |account|
      next unless @event['client']['subscriptions'].include?(account[1]['sensusub'])
      Twitter::REST::Client.new do |config|
        config.consumer_key = account[1]['consumer_key']
        config.consumer_secret = account[1]['consumer_secret']
        config.access_token = account[1]['oauth_token']
        config.access_token_secret = account[1]['oauth_token_secret']
      end
    end.compact
  end
end
