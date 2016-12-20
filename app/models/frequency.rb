class Frequency < ActiveRecord::Base
  belongs_to :income
  belongs_to :expense

  def readable_name
    name.capitalize
  end
end
