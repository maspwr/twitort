require 'open-uri'
require 'json'

module Twitort
  module Twitter
    URL = "https://api.twitter.com/1/statuses/user_timeline.json"
    
    def self.get_tweets(username)
      url      = format_url(:screen_name => username)
      response = open(url).readlines

      JSON.parse(response[0])
    end

    private
    
    def self.format_url(options)
      # FIXME: Make sure query parameters are percent escaped
      URL + "?" + options.to_a.map { |a| a.join('=') }.join('&')
    end
  end
end
