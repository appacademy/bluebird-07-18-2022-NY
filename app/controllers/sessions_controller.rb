class SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]

    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        
        if @user
            login(@user) # we still have to write this method
            redirect_to user_url(@user) # user_url(@user.id) => http://localhost:3000/users/:id
        else
            # errors coming soon => tomorrow when we learn about Flash
            render :new
        end
    
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
