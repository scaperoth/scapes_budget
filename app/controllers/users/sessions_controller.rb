class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  layout 'session'

  def create
    super
  end

  def new
    super
  end
end
