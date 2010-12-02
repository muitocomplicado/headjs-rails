module Headjs
  
  module TagHelper

    def headjs_include_tag(*sources)
      keys = []
      content_tag :script, :type => Mime::JS do
        "head.js( #{javascript_include_tag(*sources).scan(/src="([^"]+)"/).flatten.map { |src| 
          key = URI.parse(src).path[%r{[^/]+\z}].gsub(/\.js$/,'').gsub(/\.min$/,'')
          while keys.include?(key) do
            key += '_' + key
          end
          keys << key
          "{ '#{key}': '#{src}' }" 
        }.join(', ')} );"
      end
    end

  end

end
