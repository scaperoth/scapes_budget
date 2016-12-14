class Frequency < ActiveRecord::Base
  def readable_name
    name.capitalize
  end
end
