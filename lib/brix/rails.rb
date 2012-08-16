require "brix/rails/version"
require "brix/rails/view_helpers"
require "brix/rails/controller_helpers"
require "brix/will_paginate"
require "brix/simple_form"

module Brix
  module Rails
    if ::Rails.version < "3.1"
      require "brix/rails/railte"
    else
      require "brix/rails/engine"
    end
  end
end

ActionView::Base.send :include, Brix::Rails::ViewHelpers
ActionController::Base.send :include, Brix::Rails::ControllerHelpers