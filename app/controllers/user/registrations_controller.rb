class User::RegistrationsController < Devise::RegistrationsController
before_filter :check_user_secure,:resource_params, if: :devise_controller?


  def resource_params
     devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation,:secretcode)}
   end
  
  
def check_user_secure
   unless params[:user].nil?
  if params[:user][:secretcode].present?
    @secret_code = SecretCode.where(:secretcode => params[:user][:secretcode]).first
    if @secret_code.nil?
      flash[:alert] = "SecretCode Is Not valid"
      redirect_to "/users/sign_up"
    else
      @user = User.where(:secretcode => params[:user][:secretcode]).first
      unless  @user.nil?
        flash[:alert] = "SecretCode Is Not valid already used!"
        redirect_to "/users/sign_up"
      end
    end
  end
end
end
 private :resource_params
end
