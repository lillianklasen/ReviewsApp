class SessionsController < ApplicationController
    def create
        user = User.find_by_username(params[:username])

        if user.try(:authenticate, params[:password])
            session[:user_id] = user.id

            redirect_to "/users/#{user.id}"
        else
            flash[:notice] = ["Invalid email/password combination"]
            return redirect_to :back
        end
    end
end
