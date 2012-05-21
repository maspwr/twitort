require 'open-uri'
require 'json'

module Twitort
  module Twitter
    URL             = "https://api.twitter.com/1/statuses/user_timeline.json"
    DEFAULT_OPTIONS = {:count => 200}

    
    def self.get_tweets(username, p = DEFAULT_OPTIONS)
      max_count  = 1000
      max_id     = nil
      response   = []
      params     = p.merge(:screen_name => username)

      (max_count / p[:count]).ceil.times do
        params    = params.merge(:max_id => max_id) if max_id
        url       = format_url(params)
        response += JSON.parse(open(url).readlines[0])
        max_id    = get_max_id(response)
      end

      response
    end

    private

    def self.get_max_id(response)
      sorted = response.sort { |a,b| a["id"] <=> b["id"] }[0]
      sorted and sorted["id"] - 1
    end

    def self.format_url(options)
      # FIXME: Make sure query parameters are percent escaped
      URL + "?" + options.to_a.map { |a| a.join('=') }.join('&')
    end
  end
end
