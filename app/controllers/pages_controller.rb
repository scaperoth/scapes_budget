class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index
  
  before_action :set_budget
  
  def index
  end
  
  private
  
  def set_budget
    if user_signed_in? 
      @budget = Budget.where(user_id: current_user)
    end 
  end
end
