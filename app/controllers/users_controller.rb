class UsersController < ApplicationController
    
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:index, :show, :edit, :update]
    
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        # render json: user
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        # debugger
        @user = User.new(user_params)
        
        if @user.save
            # add login method when we complete login functionality
            login(@user)
            redirect_to user_url(@user)
        else
            # render json: @user.errors.full_messages, status: 422
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        # debugger
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
            # render :edit
        end
    end

    def destroy
        user = User.find(params[:id])

        user.destroy
        redirect_to users_url 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :age)
    end
end