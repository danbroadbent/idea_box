class SessionsController < ApplicationController

def new
end

def create
  @account = Account.find_by(username: params[:session][:username])
  if @account && @account.authenticate(params[:session][:password])
    session[:account_id] = @account.id
    redirect_to @account
  else
  end
end

def destroy
  session.clear
  redirect_to login_path
end

end
