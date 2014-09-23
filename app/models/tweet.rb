class Tweet
  include ActiveModel::Model

  def initialize(tweet)
    @tweet = tweet
  end

  def id
    @tweet['id_str']
  end

  def content
    @tweet['text']
  end

  def in_reply_to
    @tweet['in_reply_to_user_id_str']
  end

  def not_in_reply_to? (user_id)
    in_reply_to != user_id
  end

  def followers_count
    user['followers_count']
  end

  def user_name
    user['name']
  end

  def user
    @tweet['user']
  end

  def user_screen_name
    user['screen_name']
  end

  def mentioned?(user_id)
    !@tweet['entities']['user_mentions'].select {|mention| mention['id_str'] == user_id}.empty?
  end

  def retweet_count
    @tweet['retweet_count'].to_i
  end

  def favorite_count
    @tweet['favorite_count'] || 0
  end

  def created_at
    DateTime.parse(user['created_at'])
  end

  def classification_by_favorite_count(other)
    favorite_count <=> other.favorite_count
  end

  def classification_by_retweet_count(other)
    retweet_count <=> other.retweet_count
  end

  def classification_by_followers_count(other)
    followers_count <=> other.followers_count
  end

  def classification(other)
    classification_by_retweet_count(other) + classification_by_followers_count(other) + classification_by_favorite_count(other)
  end

  def <=>(other)
    classification(other)
  end

  def ==(other)
    id == other.id
  end

  def to_s
    "Tweet##{id}"
  end

end