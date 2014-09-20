class UsersPresenter

  def initialize(users)
    @users = users
  end

  def to_ary
    @users.collect do |user|
      UserPresenter.new user
    end
  end

end