class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: {
      user: current_user
    }
  end

  def new
    if current_user
      render json: current_user
    else
      render json: {errors: 'not authenticated'}
    end
  end

  def create
    byebug
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = {user_id: @user.id}
      token = issue_token(payload)
      render json: { user: @user, token: token}
    else
      render json: { error: "incorrect username or password"}
    end
  end



 end
