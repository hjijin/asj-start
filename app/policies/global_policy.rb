class GlobalPolicy
  attr_reader :user

  def initialize(user, _opt)
    @user = user
  end

  def is_banned?
    false
  end
end