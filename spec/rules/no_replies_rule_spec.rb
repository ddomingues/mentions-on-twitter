require 'spec_helper'

RSpec.describe Rules::NoRepliesRule do

  before do
    @tweets = [
        Tweet.new({ "in_reply_to_user_id" =>  nil}),
        Tweet.new({ "in_reply_to_user_id" =>  3232})
    ]
  end

  context "#apply" do

    it 'deve manter apenas 1 tweet' do

      subject.apply!(@tweets)

      expect(@tweets.length).to equal(1)
    end

  end

end