# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brix/rails/version"

Gem::Specification.new do |s|
  s.name        = "brix-rails"
  s.version     = Brix::Rails::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = "http://github.com/etaoux/brix-rails"
  s.summary     = %q{Brix for Rails gem, make you fast use Brix in you Rails application.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.files        = `git ls-files`.split("\n")
  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "kissy-rails", ">= 0.1.0"
  s.add_dependency "simple_form", ">= 3.0.0.rc"
  s.add_dependency "mustache"
  s.add_dependency "will_paginate"
end
