class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @events = @user.event.all 
    end
end
