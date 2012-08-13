class AddFiledsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publish, :boolean, :default => false
    add_column :posts, :rate, :integer, :default => 0
  end
end
