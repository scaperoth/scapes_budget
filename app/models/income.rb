class Income < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user
  has_one :frequency

  def frequency
    Frequency.where(id: self.frequency_id).first
  end
end
