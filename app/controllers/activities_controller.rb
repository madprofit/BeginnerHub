class ActivitiesController < ApplicationController
  def index
    @activity = Activity.all.order(created_at: 'DESC')
    @user = User.find(session[:user_id])
    # @activity = @user.activity.all
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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy

    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to '/profile', :notice => "You destroyed a like"
    # Activity.find(params[:id]).destroy
    # redirect_to '/profile'
  end

private
  def activity_params
    params.require(:activity).permit(:title, :when, :description)
  end

end
