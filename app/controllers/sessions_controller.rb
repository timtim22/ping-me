class SessionsController < ApplicationController

    def login
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "YOu are successfully logged in"
            redirect_to root_path
        else
            flash.new[:error] = "Invalid Email Address"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged In"
        redirect_to login_path
    end

end