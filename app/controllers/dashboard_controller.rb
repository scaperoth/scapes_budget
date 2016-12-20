class DashboardController < ApplicationController
  
  before_action :set_budget
  
  def index
    
  end
  
  private
  
  def set_budget
    if user_signed_in? 
      @budgets = Budget.where(user_id: current_user).order(:id)
    end 
  end
end
