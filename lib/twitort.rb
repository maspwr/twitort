require "twitort/version"
require "thor"

require "twitort/twitter"
require "twitort/sorter"

module Twitort
  class TwitortCommand < Thor
    desc "sort USERNAME", "Sorts tweets for USERNAME"
    def sort(username)
      Twitort::Sorter.display_sorted Twitort::Twitter.get_tweets(username)
    end
  end
end
