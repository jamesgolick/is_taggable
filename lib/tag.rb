class Tag < ActiveRecord::Base
  has_many :taggings

  validates_uniqueness_of :name
end
