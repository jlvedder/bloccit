 

 def user_params
   params.require(:user).permit(:name, :avatar)
 end