class BudgetsController < ApplicationController
    before_action :set_budget, only: [:show, :edit, :update, :destroy]
    before_action :set_income_and_expense, only: [:show, :edit]
    # GET /budgets
    # GET /budgets.json
    def index
        @budgets = Budget.all
    end

    # GET /budgets/1
    # GET /budgets/1.json
    def show
    end

    # GET /budgets/new
    def new
        @budget = Budget.new
    end

    # GET /budgets/1/edit
    def edit
    end

    # POST /budgets
    # POST /budgets.json
    def create
        @budget = Budget.new(budget_params)
        @budget.user = current_user
        respond_to do |format|
            if @budget.save
                format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
                format.json { render :show, status: :created, location: @budget }
            else
                format.html { render :new }
                format.json { render json: @budget.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /budgets/1
    # PATCH/PUT /budgets/1.json
    def update
        respond_to do |format|
            if @budget.update(budget_params)
                format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
                format.json { render :show, status: :ok, location: @budget }
            else
                format.html { render :edit }
                format.json { render json: @budget.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /budgets/1
    # DELETE /budgets/1.json
    def destroy
        @budget.destroy
        respond_to do |format|
            format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_budget
        @budget = Budget.find(params[:id])
    end
    
    def set_income_and_expense
        @incomes = Income.all.where(budget_id: @budget.id)
        @expenses = Expense.all.where(budget_id: @budget.id)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
        params.require(:budget).permit(:name, :planned_savings, :user_id, :active, :start_date, :end_date)
    end
end
