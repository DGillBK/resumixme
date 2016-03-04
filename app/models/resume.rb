class Resume < ActiveRecord::Base
  belongs_to :user

  attr_accessor :userName

  def initialize(attributes = {})
    @userName = attributes[:userName]
  end 
end
