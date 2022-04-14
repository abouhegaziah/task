class SessionsController < ApplicationController

    # def login
    #     flash[:notice] = "Logged in successfully"
    #     flash[:alert] = "Something went wrong! Make sure your username and password are correct"
    # end

    def create 
        @user = User.find_by(email: params[:email])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = "Logged in successfully"
            # we encrypt user info using the pre-define methods in application controller
            # token = encode_user_data({ user_data: @user.id })
            # flash[:notice] = token
            # request.headers['token'] = token

            redirect_to "/blog"
        else 
            flash[:alert] = "Something went wrong! Make sure your username and password are correct"
            redirect_to login_path
        end
    end 
end