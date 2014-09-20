class TweetsController < ApplicationController

  respond_to :html

  def mentions
    @tweets = TweetsPresenter.new tweets_mentions
  end

  def mentions_by_user
    @users = UsersPresenter.new TwitterService.mentions_by_user
  end

  private

  def tweets_mentions
    TwitterService.mentions
  end

end