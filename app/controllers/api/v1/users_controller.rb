class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    render json: User.all
  end

  def create
  user = User.create(user_params)
  if user.valid?
    payload = {user_id: user.id}
    # byebug
    token = issue_token(payload)
    render json: {user: user, token: token}
  else
    render json: {errors: user.errors.full_messages}
  end
end

private
def user_params
  params.require(:user).permit(:username, :password)
end

end
