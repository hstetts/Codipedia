class UsersController < ApplicationController
   def index
     @users = User.all
     @user = User.find(params[:id, :email])
   end

   def new
     @user = User.new
   end

   def show
     @user = User.find(params[:id, :email])
   end
#
#
#   def downgrade
#     current_user.update_attribute(:role, 'standard')
#     flash[:notice] = "Your account has been downgraded from Premium to Standard"
#     redirect_to root_path
#   end
# end
end
