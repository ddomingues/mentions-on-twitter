require 'spec_helper'

RSpec.describe Rules::UserRule do

  before do
    @tweets = [
        Tweet.new({
                      "entities" =>  {
                          "user_mentions"=> [{"id_str" => '42'}]
                      }
                  }),
        Tweet.new({
                      "entities" =>  {
                          "user_mentions"=> [{"id_str" => '4322'}]
                      }
                  })
    ]
  end

  context "#apply" do

    it 'deve manter apenas 1 tweet' do

      subject.apply!(@tweets)

      expect(@tweets.length).to equal(1)
    end

  end

end