class Budget < ActiveRecord::Base
    belongs_to :user
    has_many :incomes
    has_many :expenses
    has_one :frequency

    def frequency
        Frequency.where(id: frequency_id).first
    end

    validates_uniqueness_of :active, if: :active, message: "only one budget can be active at a time"

    protected
    
end
