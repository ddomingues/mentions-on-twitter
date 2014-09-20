class TwitterService

  def self.mentions
    tweets = Twitter::Api::Client.new
      .search_tweets
    Rules::RuleEngine.process! tweets
    tweets
  end

  def self.mentions_by_user
    mentions
      .group_by {|tweet| tweet.user_screen_name}
      .to_a.collect! do |user_screen_name, tweets|
        {}.tap do |user|
          user[:screen_name] = user_screen_name
          user[:tweets] = tweets
          user[:name] = user[:tweets].first.user_name
        end
      end.sort! {|user, other| other[:tweets].count <=> user[:tweets].count}
  end

end