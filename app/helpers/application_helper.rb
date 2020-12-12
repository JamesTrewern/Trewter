module ApplicationHelper
  def authenticate_profile()
    authenticate_user!
    unless current_user.profile
      redirect_to new_profile_path()
    end
  end
end
