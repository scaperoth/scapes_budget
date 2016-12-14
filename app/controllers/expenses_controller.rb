class ExpensesController < ApplicationController
    #->Prelang (scaffolding:rails/scope_to_user)
    before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

    before_action :set_expense, only: [:show, :edit, :update, :destroy]
    before_action :set_budget, only: [:index, :show, :new, :create, :destroy]

    # GET /expenses
    # GET /expenses.json
    def index
        @expenses = Expense.all
    end

    # GET /expenses/1
    # GET /expenses/1.json
    def show
    end

    # GET /expenses/new
    def new
        @expense = Expense.new
    end

    # GET /expenses/1/edit
    def edit
    end

    # POST /expenses
    # POST /expenses.json
    def create
        @expense = Expense.new(expense_params)
        @expense.user = current_user
        @expense.budget = @budget
        respond_to do |format|
            if @expense.save
                format.html { redirect_to edit_budget_path(@budget), notice: 'Expense was successfully created.' }
                format.json { render :show, status: :created, location: edit_budget_path(@budget) }
            else
                format.html { render :new }
                format.json { render json: @expense.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /expenses/1
    # PATCH/PUT /expenses/1.json
    def update
        respond_to do |format|
            if @expense.update(expense_params)
                format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
                format.json { render :show, status: :ok, location: @expense }
            else
                format.html { render :edit }
                format.json { render json: @expense.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /expenses/1
    # DELETE /expenses/1.json
    def destroy
        @expense.destroy
        respond_to do |format|
            format.html { redirect_to edit_budget_path(@budget), notice: 'Expense was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_expense
        @expense = Expense.find(params[:id])
    end

    # set budget for specific expense
    def set_budget
        @budget = Budget.find(params[:budget_id]) unless params[:budget_id].nil?
        @budget = Budget.find(@expense.budget_id) unless @expense.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
        params.require(:expense).permit(:frequency_id, :name, :amount, :notes, :budget_id, :user_id)
    end
end
