require 'helper'
require 'generators/headjs/install/install_generator'

class Headjs::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  tests Headjs::Generators::InstallGenerator
  destination File.join(File.dirname(__FILE__), 'tmp')
  teardown :cleanup_destination_root
  
  context 'the Head JS install generator' do
    
    should 'download the default 1.0.0 files' do
      run_generator %w(headjs:install)
      assert_file 'public/javascripts/head.js'
      assert_file 'public/javascripts/head.min.js'
    end
    
    should 'download version 0.99 files' do
      run_generator %w(headjs:install --version 0.99)
      assert_file 'public/javascripts/head.js'
      assert_file 'public/javascripts/head.min.js'
    end
    
  end
  
  private
  
  def cleanup_destination_root
    FileUtils.rm_r(destination_root)
  end

end