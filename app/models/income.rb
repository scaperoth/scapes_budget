class Income < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  has_one :frequency
  
  scope :unique_categories, group(:category)
  
  def frequency
    Frequency.where(id: self.frequency_id).first
  end
end
