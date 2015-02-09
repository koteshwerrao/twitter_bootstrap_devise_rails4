class SecretCodesController < ApplicationController
before_filter :check_user_admin
  def index
    @secret_codes = SecretCode.all
 end

def create
	params[:secret_code_no].to_i.times.each do 
	 @secret_code = SecretCode.new(ad_params)
	  @secret_code.save
      end
     flash[:notice]="#{params[:secret_code_no].to_i} SecretCodes are Created Successfully ."
      redirect_to(secret_codes_path)

end




def new
  @secret_code = SecretCode.new
end


def edit
  @secret_code = SecretCode.where(:id => params[:id]).first
end


def update
  @secret_code = SecretCode.where(:id => params[:id]).first
	if @secret_code.update_attributes(ad_params)
	    flash[:notice] = "SecretCode Updated Successfully"
	    redirect_to secret_codes_path
	end
end

def show
    @secret_code = SecretCode.where(:id => params[:id]).first

end


def destroy
    @secret_code = SecretCode.where(:id => params[:id]).first
	@secret_code.destroy
  redirect_to(secret_codes_path)

end




def ad_params
  params.require(:secret_code).permit(:user_id,:secretcode,:secret_code_no)
end



def check_user_admin
if current_user.role != "admin"
  redirect_to "/"
end 


  end
end
