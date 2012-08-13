class Category < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.as_collection
    self.all.collect { |c| [c.name, c.id] }
  end
end
