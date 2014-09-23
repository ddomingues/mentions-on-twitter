require 'spec_helper'

RSpec.describe Rules::UserRule do

  subject { Rules::UserRule.new(Rules::RuleEngine::ID_USER_LOCAWEB) }

  def tweet(id_user_mentioned)
    Tweet.new(
      {
        'entities' => {
          'user_mentions' => [{'id_str' => id_user_mentioned}]
        }
      }
    )
  end

  before do
    @tweets = [ tweet('42'), tweet('4322') ]
  end

  context '#apply' do

    it 'should keep only 1 tweet' do

      subject.apply!(@tweets)

      expect(@tweets.length).to equal(1)
    end

  end

end