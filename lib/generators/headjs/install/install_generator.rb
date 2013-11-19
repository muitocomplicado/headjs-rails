require "openssl"
module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module Headjs
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs Head JS"
      class_option :version, :type => :string, :default => "1.0.0", :desc => "Which version of Head JS to fetch"
      @@default_version = "1.0.0"
      @@dist_url = "https://raw.github.com/headjs/headjs/master/dist/{version}/{file}"

      def remove_headjs
        %w(head.js head.min.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_headjs
        say_status("fetching", "Head JS (#{options.version})", :green)
        get_headjs(options.version)
      rescue OpenURI::HTTPError
        say_status("warning", "could not find Head JS (#{options.version})", :yellow)
        say_status("warning", headjs_url(options.version, 'head.js'), :yellow)
        say_status("warning", headjs_url(options.version, 'head.min.js'), :yellow)
        
        if @@default_version != options.version
          say_status("fetching", "Head JS (#{@@default_version})", :green)
          get_headjs(@@default_version)
        end
      end

    private

      def get_headjs(version)
        %w(head.js head.min.js).each do |js|
          get headjs_url(version, js), "public/javascripts/#{js}"
        end
      end
      
      def headjs_url(version, file)
        @@dist_url.gsub("{version}", version).gsub("{file}", file)
      end

    end
  end
end