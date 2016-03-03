class Position < ActiveRecord::Base
  belongs_to :employment
  has_many :responsibilities
end
