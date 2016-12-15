class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :incomes
  has_many :expenses
  has_one :frequency


  def frequency
    Frequency.where(id: self.frequency_id).first
  end

end
