class Tag < ActiveRecord::Base
  class << self
    def find_or_initialize_with_name_like(name)
      with_name_like(name).first || new(:name => name)
    end
  end

  has_many :taggings

  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :with_name_like, lambda { |name| { :conditions => ["name like ?", name] } }
end
