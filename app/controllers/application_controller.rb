class ApplicationController < ActionController::API
    before_action :authorized

  def issue_token(payload)
    byebug
    JWT.encode(payload, ENV['secret'], 'HS256')
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def user_id
    decoded_token.first['user_id']
  end

  def decoded_token
    # byebug
    begin
       JWT.decode(request.headers['Authorization'], ENV['secret'])
     rescue JWT::DecodeError
      [{}]
     end
  end

  def authorized
    render json: {message: "Not welcome" }, status: 401 unless logged_in?
  end

  def logged_in?
    !!current_user
  end
end
