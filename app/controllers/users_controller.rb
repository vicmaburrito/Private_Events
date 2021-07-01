class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events.all
    @past_events = @user.attended_events.past
    @upcoming_events = @user.attended_events.future
  end
end
