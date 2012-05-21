require 'open-uri'
require 'json'

module Twitort
  module Twitter
    URL             = "https://api.twitter.com/1/statuses/user_timeline.json"
    DEFAULT_OPTIONS = {:params    => {:count => 200},
                       :max_count => 1000}
    
    def self.get_tweets(username, p = DEFAULT_OPTIONS)
      max_count  = p[:max_count]
      max_id     = last_max_id = nil
      tweets     = []
      params     = p[:params].merge(:screen_name => username)

      while max_count > 0
        params    = params.merge(:max_id => max_id) if max_id
        url       = format_url(params)
        response  = JSON.parse(open(url).readlines[0])
        max_id    = get_max_id(response)

        # If we aren't getting any new tweets, break out of the loop.
        break if max_id == last_max_id

        max_count   -= response.size
        tweets      += response
        last_max_id  = max_id
      end

      # Limit the results to p[:max_count] as our last GET might have
      # pulled more than we wanted.
      tweets[0..(p[:max_count]-1)]
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
