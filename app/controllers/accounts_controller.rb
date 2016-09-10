class AccountsController < ApplicationController

def new
  @account = Account.new
end

def create
  @account = Account.new
  if @account.save
    redirect_to ideas_path
  else
    render :new
  end
end

end
