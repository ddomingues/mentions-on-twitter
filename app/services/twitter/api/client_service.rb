module Twitter
  module Api
    class ClientService

      URL_SEARCH = 'http://xxxcnn0330.locaweb.com.br/tweeps'

      def self.search

        tweets = self.search_tweets

        tweets['statuses'].map do |tweet|
          Twitter::Tweet.new( user: tweet['user']['screen_name'],
              followers_count: tweet['user']['screen_name'],
              content: tweet['text'],
              retweeted_count: tweet['retweet_count'],
              favourites_count: tweet['favourites_count']
          )
        end

      end

      def self.search_tweets
        uri = URI(URL_SEARCH)
        request = Net::HTTP::Get.new(uri)
        request['Username'] = 'diego.domingues16@gmail.com'
        response = Net::HTTP.start(uri.hostname, uri.port) { |http|
          http.request( request )
        }

        JSON.parse(response.body)
      end

    end
  end
end
