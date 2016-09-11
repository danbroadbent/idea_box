class AccountsController < ApplicationController

def new
  @account = Account.new
end

def show
end

def create
  @account = Account.create(account_params)
  if @account.save
    session[:account_id] = @account.id
    redirect_to @account
  else
    render :new
  end
end

private

def account_params
  params.require(:account).permit(:username, :password)
end

end
