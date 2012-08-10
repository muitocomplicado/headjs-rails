module Headjs
  
  module TagHelper

    def headjs_include_tag(*sources)
      content_tag :script, { :type => Mime::JS }, false do
        headjs_include_js(*sources)
      end
    end

    def headjs_include_js(*sources)
      keys = []
      "head.js( #{javascript_include_tag(*sources).scan(/src="([^"]+)"/).flatten.map { |src| 
        key = 
          URI.
            parse(src).
            path[%r{[^/]+\z}].
            gsub(/\.js$/,'').
            gsub(/\.min$/,'').
            gsub(/-[0-9a-f]{32}$/,'')
        while keys.include?(key) do
          key += '_' + key
        end
        keys << key
        "{ '#{key}': '#{src}' }"
      }.join(', ')} );".html_safe
    end

  end

end
