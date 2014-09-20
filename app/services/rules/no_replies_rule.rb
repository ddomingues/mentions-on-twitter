module Rules
  class NoRepliesRule < Rule
    def run!(tweets)
      tweets.select! {|tweet| tweet.in_reply_to.nil?}
    end
  end
end