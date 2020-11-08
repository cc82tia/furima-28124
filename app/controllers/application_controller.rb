class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


 #(省略)
  def index
  end

  def new
   @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
  end
  
  def destroy
  end

  def user
    params.require(:user_donation).permit(:nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birthday)
  end
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
   end 
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end