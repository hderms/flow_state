require 'tweetstream'
require 'juggernaut'
require 'set'
require 'cgi'
seen_tweets = Set.new

TweetStream.configure do |config|
  config.username     = 'TwittyCaca'
  config.password     = '123123123'
  config.auth_method  = :basic
end 
status = TweetStream::Client.new.sample do |status|



  puts status.text


  unless status.text.empty?  or status.text.nil?
    Juggernaut.publish("channel1", CGI::escapeHTML(status.text))
  end
  seen_tweets += status.text
end
