class Account < ActiveRecord::Base
  has_secure_password
  enum role: [:user, :admin]
end
