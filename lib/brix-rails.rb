require "brix/rails/version"
require "brix/rails/helpers"

module Brix
  module Rails
    require "brix/rails/railte"
  end
end

ActionView::Base.send :include, Brix::Rails::Helpers