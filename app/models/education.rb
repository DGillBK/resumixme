class Education < ActiveRecord::Base
  
  belongs_to :user
  has_many :degrees
  has_many :achievements

end
