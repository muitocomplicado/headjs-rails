module HeadjsRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs Head JS"
      class_option :version, :type => :string, :default => "master", :desc => "Which version of Head JS to fetch"
      @@default_version = "master"

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
        say_status("fetching", "Head JS (#{@@default_version})", :green)
        get_headjs(@@default_version)
      end

    private

      def get_headjs(version)
        get "https://github.com/headjs/headjs/raw/#{version}/head.js",     "public/javascripts/head.js"
        get "https://github.com/headjs/headjs/raw/#{version}/head.min.js", "public/javascripts/head.min.js"
      end

    end
  end
end