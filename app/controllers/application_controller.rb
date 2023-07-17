class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # include BasicAuth
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "您没有权限执行此操作。"
    redirect_to(request.referrer || root_path)
  end
end
