class Budget < ActiveRecord::Base
    belongs_to :user
    has_many :incomes
    has_many :expenses

    validates_uniqueness_of :active, if: :active, message: "only one budget can be active at a time"
    validates_uniqueness_of :name,  message: "budget names must be unique"

    protected
    
end
