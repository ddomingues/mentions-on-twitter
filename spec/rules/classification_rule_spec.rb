require 'spec_helper'

RSpec.describe Rules::ClassificationRule do

  def tweet(id, retweets, favorites, followers)
    Tweet.new(
      {
        'id_str' => id,
        'retweet_count' => retweets,
        'favorite_count' => favorites,
        'user' => {
          'followers_count' => followers
        }
      }
    )
  end

  before do
    @tweet_1 = tweet('1', 10, nil, 100)
    @tweet_2 = tweet('2', 15, 20, 200)
    @tweet_3 = tweet('3', 20, 30, 211)
  end

  context '#apply' do

    it 'should sort tweets by Retweet count, Followers and favorite_count with the same weight' do
      @tweets = [@tweet_1, @tweet_2, @tweet_3]

      subject.apply!(@tweets)

      expect(@tweets).to start_with(@tweet_3, @tweet_2, @tweet_1)
    end

  end

end