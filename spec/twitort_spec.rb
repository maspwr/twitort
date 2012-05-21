require 'spec_helper'

describe 'Twitort' do

  def tweets
    [{"text" => "hello world"},
     {"text" => "hello everyone, and world"},
     {"text" => "hi world"}]
  end

  def words
    %w{hello world hello everyone and world hi world}
  end

  def sorted_words
    %w{world hello and everyone hi}
  end

  describe 'Sorter' do
    it 'gets words from tweets' do
      Twitort::Sorter.get_words(tweets).should eq words
    end

    it 'sorts words from tweets' do
      Twitort::Sorter.sort_words(words).should eq sorted_words
    end
  end

  describe 'Twitter' do
    it 'gets up to 1000 tweets' do
      tweets = Twitort::Twitter.get_tweets('twitterapi')
      tweets.size.should eq 1000
    end
  end
end
