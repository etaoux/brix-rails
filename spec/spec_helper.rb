require 'rubygems'
require "rspec"
require "active_record"
require 'active_support'
require "action_view"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "rails/railtie"
require "brix-rails"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.configurations = true

ActiveRecord::Schema.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :login
    t.string :password
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table :posts do |t|
    t.string :title
    t.text :body
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

RSpec.configure do |config|
  config.before(:all) do
    class User < ActiveRecord::Base; end
    class Post < ActiveRecord::Base; end
  end

  config.include Brix::Rails::Helpers
  config.include ActionView::Helpers::UrlHelper

  config.after(:all) do
  end
end

