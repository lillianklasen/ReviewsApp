class UsersController < ApplicationController
    def index
    end

    def create
        user = User.new(user_params)
        if (user.valid?)
            user.save
            flash[:notice] = ["Account created. Please log in."]
            redirect_to '/'
        else
            flash[:notice] = user.errors.full_messages
            redirect_to '/'
        end
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
        end
end
