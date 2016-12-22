class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper

  def create
    super
  end
  
  def new
    super
  end
  
  def destroy
    super
  end
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end 
end
