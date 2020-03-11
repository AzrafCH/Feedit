module FormHelper

  def setup_user(user)
    user.settings ||= Setting.new
    user
  end
end 
