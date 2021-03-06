require 'rspec/core'
require "active_record"
require "action_view"
require "action_controller"
require "rails"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "rails/railtie"
require "brix-rails"
require 'rspec-html-matchers'

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

  # config.include Helpers
  config.include Brix::Rails::ViewHelpers
  config.include ActionView::Helpers

  config.after(:all) do
  end
end

