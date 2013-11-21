class Gallery < ActiveRecord::Base
  attr_accessible :name, :owner, :comment
  has_many :photos
end
