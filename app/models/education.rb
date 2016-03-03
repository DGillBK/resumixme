class Education < ActiveRecord::Base
  
  belongs_to :user
  has_many :degrees
  has_many :achievements

  # attr_accessor :educationDegrees

  # def initialize(attributes = {})
  #   @educationDegrees = attributes[:educationDegrees]
  # end 

end
