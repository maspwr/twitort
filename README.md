# Twitort

twitort - Twitter Sorter

Sorts and prints the words in a given twitter user's last 1000 tweets
sorted by frequency of use.

For example, if jack had tweeted:
"hello world"
"hello everyone, and world"
"hi world"

The result could be:
world
hello
and
hi
everyone

Twitter Docs:
https://dev.twitter.com/docs/api/1/get/statuses/user_timeline

## Installation

Install it yourself as:

    $ rake install

## Usage

Simply call 'sort' with the username of the Twitter user you are
interested in.  The sorted words will be printed to stdout.

    $ twitort sort USERNAME

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
