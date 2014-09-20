class TweetPresenter

  delegate :content, :created_at, :to => :@tweet

  attr_accessor :show_user

  def initialize(tweet, show_user = true)
    @tweet = tweet
    @show_user = show_user
  end

  def show_user?
    @show_user
  end

  def user_name
    @tweet.user_name if show_user?
  end

  def user_screen_name
    "@#{@tweet.user_screen_name}  - " if show_user?
  end

  def show_empty_or_count(icon, class_color, valor)
    retweets_content = helpers.content_tag(:span, '', class: "glyphicon glyphicon-#{icon}")
    class_tweet = 'empty'

    if valor > 0
      retweets_content += helpers.content_tag(:small, ' ' + valor.to_s)
      class_tweet = class_color
    end

    helpers.content_tag(:li, retweets_content.html_safe , class: class_tweet)
  end

  def retweet_count
    show_empty_or_count 'retweet', 'green', @tweet.retweet_count
  end

  def favorite_count
    show_empty_or_count 'star', 'golden', @tweet.favorite_count
  end

  def followers_count
    show_empty_or_count 'user', 'user', @tweet.followers_count if show_user?
  end

  def url
    "https://twitter.com/#{@tweet.user_screen_name}/status/#{@tweet.id}"
  end

  def to_partial_path
    'tweet'
  end

  private

  def helpers
    ApplicationController.helpers
  end

end