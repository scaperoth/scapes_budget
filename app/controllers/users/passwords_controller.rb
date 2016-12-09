class Users::PasswordsController < Devise::PasswordsController
  include ApplicationHelper
  layout 'session'

  def new
    super
  end
end
