module Twitter
  module Api
    class Client

      URL_SEARCH = 'http://xxxcnn0330.locaweb.com.br/tweeps'
      HEADER_PARAM = 'Username'
      USER_EMAIL = 'diego.domingues16@gmail.com'

      def search_tweets

        tweets = search

        tweets['statuses'].map do |tweet|
          Tweet.new tweet
        end

      end

      private

      def search

        begin
          uri = URI(URL_SEARCH)
          request = Net::HTTP::Get.new(uri)
          request[HEADER_PARAM] = USER_EMAIL
          response = Net::HTTP.start(uri.hostname, uri.port) { |http|
            http.request( request )
          }

          JSON.parse(response.body)
        rescue
          raise I18n.t(:not_connect_to_server)
        end
      end

    end
  end
end
