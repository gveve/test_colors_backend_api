class Api::V1::AuthenticationController < ApplicationController
  # skip_before_action :authorized

  def show
    render json: {
      id: current_user.id,
      username: current_user.username
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
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = {user_id: @user.id}
      token = issue_token(payload)
      render json: { username: @user, token: token}
    else
      render json: { error: "your credentials are wrong"}
    end
  end



 end
