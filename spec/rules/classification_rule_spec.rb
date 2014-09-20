require 'spec_helper'

RSpec.describe Rules::ClassificationRule do

  before do
    @tweet_1 = Tweet.new({
                              'id_str' => '1',
                              'retweet_count' => 10,
                              'user' => {
                                  'followers_count' => 100
                              }
                          })


    @tweet_2 = Tweet.new({
                               'id_str' => '2',
                               'retweet_count' => 15,
                               'user' => {
                                   'followers_count' => 200
                               }
                           })
    @tweet_3 = Tweet.new({
                               'id_str' => '3',
                               'retweet_count' => 20,
                               'user' => {
                                   'followers_count' => 211
                               }
                           })
  end

  context "#apply" do

    it 'should sort tweets by Retweet count, Followers and favorite_count with the same weight' do
      @tweets = [@tweet_1, @tweet_2, @tweet_3]

      subject.apply!(@tweets)

      expect(@tweets).to start_with(@tweet_3, @tweet_2, @tweet_1)
    end

  end

end