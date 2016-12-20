class Expense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  has_one :frequency
  
  scope :unique_categories, -> {select("DISTINCT ON (category) *")}
  
  def frequency
    Frequency.where(id: self.frequency_id).first
  end
end
