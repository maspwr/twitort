require "twitort/version"
require "thor"

require "twitort/twitter"
require "twitort/sorter"

module Twitort
  class TwitortCommand < Thor
    desc "sort", "Sorts tweets"
    def sort(username)
      Twitort::Sorter.display_sorted Twitort::Twitter.get_tweets(username)
    end
  end
end
