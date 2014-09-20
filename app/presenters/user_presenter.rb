class UserPresenter

  def initialize(user)
    @user = user
    @user[:tweets] = TweetsPresenter.new @user[:tweets], false
  end

  def perfil_url
    "https://twitter.com/#{screen_name}"
  end

  def screen_name
    "@#{@user[:screen_name]}"
  end

  def name
    @user[:name]
  end

  def tweets_count
    tweets.length
  end

  def tweets
    @user[:tweets]
  end

  def to_partial_path
    'user'
  end

end