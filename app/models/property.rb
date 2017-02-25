class Property < ActiveRecord::Base
  enum type: [:house, :deparment]

private
  def self.inheritance_column
    nil
  end
  
end
