class Api::UsersController < ApplicationController
  def own_library
    @user =  User.find(params[:user_id])
    @library = @user.own_library
    json_response(@library)
  end
end
