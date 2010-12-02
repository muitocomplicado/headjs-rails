require 'helper'
require 'generators/headjs/install/install_generator'

class Headjs::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  tests Headjs::Generators::InstallGenerator
  destination File.join(File.dirname(__FILE__), 'tmp')
  teardown :cleanup_destination_root
  
  context 'the Head JS install generator' do
    
    should 'download the default master Head JS files' do
      run_generator %w(headjs:install)
      assert_file 'public/javascripts/head.js'
      assert_file 'public/javascripts/head.min.js'
    end
    
    should 'download the versioned Head JS files' do
      run_generator %w(headjs:install --version master)
      assert_file 'public/javascripts/head.js'
      assert_file 'public/javascripts/head.min.js'
    end
    
  end
  
  private
  
  def cleanup_destination_root
    FileUtils.rm_r(destination_root)
  end

end