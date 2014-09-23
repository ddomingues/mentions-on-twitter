module Rules
  class UserRule < Rule

    def initialize(id_user)
      @id_user = id_user
    end

    def run!(tweets)
      tweets.select! {|tweet| tweet.mentioned? @id_user}
    end
  end
end