require 'helper'

module Headjs
  
  class TagHelperTest < Test::Unit::TestCase
    
    def setup
      
      ENV["RAILS_ASSET_ID"] = ''
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => %w(jquery rails)
      
      public_dir = File.join(File.dirname(__FILE__), 'public')
      @helpers = ActionController::Base.helpers
      @helpers.config.perform_caching = false
      @helpers.config.assets_dir = public_dir
      @helpers.config.javascripts_dir = "#{public_dir}/javascripts"
      
      %w(all.js bundle.js).each do |js|
        begin
          File.delete(File.join(public_dir, 'javascripts', js))
        rescue
        end
      end
    
    end
    
    def jquery
      'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'
    end
    
    context "The Head JS helper include tag" do
    
      should "return a valid script tag" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '#{jquery}' } );</script>", @helpers.headjs_include_tag(jquery)
      end
      
      should "increase label counter to avoid overwriting" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'comments': '/javascripts/products/comments.js' }, { 'comments_1': '/javascripts/reviews/comments.js' } );</script>", @helpers.headjs_include_tag('products/comments', 'reviews/comments')
      end
      
      should "accept strings for local paths" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '/javascripts/jquery.js' }, { 'rails': '/javascripts/other/rails.js' } );</script>", @helpers.headjs_include_tag('jquery', 'other/rails')
      end
      
      should "accept :defaults registered expansions" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '/javascripts/jquery.js' }, { 'rails': '/javascripts/rails.js' } );</script>", @helpers.headjs_include_tag(:defaults)
      end
      
      should "accept :defaults mixed with other strings" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '/javascripts/jquery.js' }, { 'rails': '/javascripts/rails.js' }, { 'modernizr': '/javascripts/modernizr.js' } );</script>", @helpers.headjs_include_tag(:defaults, 'modernizr')
      end
      
      should "accept :all expansion" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '/javascripts/jquery.js' }, { 'rails': '/javascripts/rails.js' }, { 'application': '/javascripts/application.js' } );</script>", @helpers.headjs_include_tag(:all)
      end
      
      should "accept a :cache => true parameter" do
        @helpers.config.perform_caching = true
        assert_equal "<script type=\"text/javascript\">head.js( { 'all': '/javascripts/all.js' } );</script>", @helpers.headjs_include_tag(:defaults, :cache => true)
      end
      
      should "accept a :cache => bundle parameter" do
        @helpers.config.perform_caching = true
        assert_equal "<script type=\"text/javascript\">head.js( { 'bundle': '/javascripts/bundle.js' } );</script>", @helpers.headjs_include_tag(:defaults, :cache => 'bundle')
      end
      
      should "work with random rails asset ids" do
        ENV["RAILS_ASSET_ID"] = '123456789'
        assert_equal "<script type=\"text/javascript\">head.js( { 'jquery': '/javascripts/jquery.js?#{ENV["RAILS_ASSET_ID"]}' }, { 'rails': '/javascripts/rails.js?#{ENV["RAILS_ASSET_ID"]}' } );</script>", @helpers.headjs_include_tag(:defaults)
      end
      
      should "remove rails asset hashes" do
        assert_equal "<script type=\"text/javascript\">head.js( { 'foo': '/assets/foo-f1d2d2f924e986ac86fdf7b36c94bcdf.js' } );</script>", @helpers.headjs_include_tag('/assets/foo-f1d2d2f924e986ac86fdf7b36c94bcdf.js')
      end
      
    end
    
  end
  
end
