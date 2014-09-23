module Rules
  class NoRepliesRule < Rule

    def initialize(id_user)
      @id_user = id_user
    end

    def run!(tweets)
      tweets.select! {|tweet| tweet.not_in_reply_to? @id_user}
    end
  end
end