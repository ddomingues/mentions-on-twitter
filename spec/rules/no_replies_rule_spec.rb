require 'spec_helper'

RSpec.describe Rules::NoRepliesRule do

  subject { Rules::NoRepliesRule.new(Rules::RuleEngine::ID_USER_LOCAWEB) }

  def tweet(id)
    Tweet.new({'in_reply_to_user_id_str' => id})
  end

  before do
    @tweets = [tweet(nil), tweet('42'), tweet('3232')]
  end

  context '#apply' do

    it 'should keep only 2 tweets' do

      subject.apply!(@tweets)

      expect(@tweets.length).to equal(2)
    end

  end

end