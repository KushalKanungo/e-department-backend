class AuthController < ApplicationController

  def login
      payload = ''
      # debugger
      if params[:token]
        payload = AuthService.verify(params[:token]["credential"])
        p payload["email"]
        if (payload["email"] == 'kushalkhandelwal27@gmail.com' || payload["email"] == 'kushal.kanungo@metacube.com' )
          session[:email] = payload["email"]
          # session.save
        else
          render plain: 'You are not authorized to access this resource', status: :unauthorized
          return
        end

      end

      puts payload
      render json: {loggedIN: true}, status: :ok
  end

end
