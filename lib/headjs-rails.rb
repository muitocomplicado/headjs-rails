require File.join(File.dirname(__FILE__), 'headjs-rails', 'tag_helper')

ActionController::Base.helper(Headjs::TagHelper)