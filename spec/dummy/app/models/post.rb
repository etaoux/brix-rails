class Post < ActiveRecord::Base
  belongs_to :category

  delegate :name, :to => :category, :prefix => true, :allow_nil => true

  validates_presence_of :title, :body, :category_id
end
