class TweetsPresenter

  delegate :length, to: :@tweets

  def initialize(tweets, show_user = true)
    @tweets = tweets
    @show_user = show_user
  end

  def to_ary
    @tweets.map do |tweet|
      TweetPresenter.new tweet, @show_user
    end
  end

end