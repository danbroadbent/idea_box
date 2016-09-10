class AccountsController < ApplicationController

def new
  @account = Account.new
end

def create
  @account = Account.create(account_params)
  if @account.save
    redirect_to ideas_path
  else
    render :new
  end
end

private

def account_params
  params.require(:account).permit(:username, :password)
end

end
