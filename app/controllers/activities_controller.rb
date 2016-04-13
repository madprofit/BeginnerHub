class ActivitiesController < ApplicationController
  def index
    @activity = Activity.all.order(created_at: 'DESC')
    @user = User.find(session[:user_id])
    @activity = @user.activity.new
  end

  def new
    @activity = Activity.new
    @user = User.find(session[:user_id])

  end

  def create

    @activity = Activity.new(activity_params)
    @activity.user_id = session[:user_id]
    if @activity.save
      redirect_to '/profile'
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
      activity.delete(:activity_id)
      redirect_to '/profile'
  end

private
  def activity_params
    params.require(:activity).permit(:title, :when, :description)
  end

end
