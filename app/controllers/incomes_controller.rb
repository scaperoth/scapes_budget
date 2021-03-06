class IncomesController < ApplicationController
  autocomplete :income, :category, scopes: [:unique_categories], full: true

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :set_budget, only: [:index, :edit, :show, :new, :create, :destroy]

  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = Income.all.where(user: current_user)
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)
    @income.user = current_user
    @income.budget = @budget

    respond_to do |format|
      if @income.save
        format.html { redirect_to edit_budget_path(@budget), notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: edit_budget_path(@budget) }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to edit_budget_path(@budget), notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.where(user: current_user).find(params[:id])
    end

    # set budget for specific expense
    def set_budget
        @budget = current_user.budgets.find(params[:budget_id]) unless params[:budget_id].nil?
        @budget = current_user.budgets.find(@income.budget_id) unless @income.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:frequency_id, :name, :category, :date, :amount, :notes, :budget_id, :user_id)
    end
end
