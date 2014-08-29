# -*- coding: utf-8 -*-
# $:.unshift("/Library/RubyMotion2.31/lib") # No crash
$:.unshift("/Library/RubyMotion2.32/lib") # Crash
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'rubymotion_232_regression'
end
