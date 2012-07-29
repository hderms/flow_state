require 'twitter'
require 'juggernaut'
require 'set'
seen_tweets = Set.new
while true
  sleep 5
   status =Twitter.search("#ruby", rpp:1, result_type: "recent").to_hash 

    texts = status[:results].map{|result| result[:text]}
    

    new_tweets =  texts.select {|text| !seen_tweets.include?(text) and !text.is_empty? and !text.is_nil?}
     
    puts new_tweets
      Juggernaut.publish("channel1", new_tweets) 
    seen_tweets += new_tweets
end
