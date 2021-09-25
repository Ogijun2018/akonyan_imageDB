class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_smartphone

  private
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def check_smartphone
    @smartphone = request.from_smartphone?
  end
end
