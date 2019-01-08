class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You are successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "Invalid Email Address"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged Out"
        redirect_to login_path
    end

    private

    def logged_in_redirect 
        if logged_in?
            flash[:error] = "Already Loogged In"
            redirect_to root_path
        end
    end

end