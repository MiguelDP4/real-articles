class ApplicationController < ActionController::Base
  before_action :require_login
  private

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
