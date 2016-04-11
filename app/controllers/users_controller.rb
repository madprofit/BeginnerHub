class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new({
      name:params[:name],
      email:params[:email],
      password:params[:password],
      password_confirmation:params[:password_confirmation]
      })

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/show'
    else
      render :new
    end
  end


end
