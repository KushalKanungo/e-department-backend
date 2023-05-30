class AuthController < ApplicationController


    def login
      payload = AuthService.verify(params[:token]["credential"])
      @user = User.find_by(email: payload["email"])
    # authenticate method from bycrpt
    # same as @user && authenticate(user_params_login[:password])
    if @user
      # Create a token if user exist
      token = encode_token({ user_id: @user.id }, Time.now.to_i + 120)
      render json: { accessToken: token, isAdmin: @user.isAdmin }, status: :ok
      return
    else
      render json: { error: 'You are not resgistered' }, status: :unprocessable_entity
    end
  end

end
