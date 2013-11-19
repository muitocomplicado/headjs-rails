module Headjs
  
  module TagHelper

    def headjs_include_tag(*sources)
      content_tag :script, { :type => Mime::JS }, false do
        headjs_include_js(*sources)
      end
    end

    def headjs_include_js(*sources)
      "head.js( #{headjs_include_params(*sources)} );".html_safe
    end

    def headjs_include_params(*sources)
      keys = []
      javascript_include_tag(*sources).
        scan(/src="([^"]+)"/).
        flatten.
        map do |src| 
          cnt = 0
          key = original_key = 
            URI.
            parse(src).
            path[%r{[^/]+\z}].
            gsub(/\.js$/,'').
            gsub(/\.min$/,'').
            gsub(/-[0-9a-f]{32}$/,'')
          while keys.include?(key) do
            key = "#{original_key}_#{(cnt = cnt.succ)}"
          end
          keys << key
          "{ '#{key}': '#{src}' }"
        end.join(', ').html_safe
    end

  end

end
