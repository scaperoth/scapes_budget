class Income < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  has_one :frequency
  has_and_belongs_to_many :categories

  def frequency
    Frequency.where(id: self.frequency_id).first
  end
end
