module Twitter
  class Tweet
    include ActiveModel::Model

    attr_accessor :retweeted_count, :content, :created_at, :followers_count, :favourites_count, :id, :user
  end
end