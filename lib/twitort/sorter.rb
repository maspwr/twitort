module Twitort
  module Sorter

    def self.display_sorted(tweets)
      words = sort_words(get_words(tweets))

      puts words
    end

    def self.sort_words(words)
      words.inject({}) do |counts, word|
        counts[word] ? counts[word] += 1 : counts[word] = 0
        counts
      end.to_a.sort do |a, b|
        if a[1] == b[1]
          a[0] <=> b[0]
        else
          b[1] <=> a[1]
        end
      end.map { |a| a[0] }
    end

    def self.get_words(tweets)
      strings = tweets.map { |t| t["text"] }
      words   = strings.map { |string| string.split(' ') }.flatten

      # Remove beginning and ending punctuation from words
      words.map! do |word|
        word.sub(/\A\W+/, '')
            .sub(/\W+\z/, '')
      end.delete_if { |a| !a or a == '' }
    end
  end
end
