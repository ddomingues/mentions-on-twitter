module Rules
  class UserRule < Rule

    ID_USER_LOCAWEB = '42'

    def initialize(id_user = ID_USER_LOCAWEB)
      @id_user = id_user
    end

    def run!(tweets)
      tweets.select! {|tweet| tweet.mentioned? @id_user}
    end
  end
end