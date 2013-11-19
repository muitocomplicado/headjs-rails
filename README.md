# headjs-rails

This gem adds a helper and a generator to facilitate the use of [Head JS](http://headjs.com) in your Rails 3 projects, the same way you would normally add javascript tags using Rails `javascript_include_tag` helper.

## Usage

In your Gemfile, add this line:

    gem "headjs-rails"

Then, run `bundle install`. To invoke the generator and install the latest Head JS files in your `public/javascripts` folder, run:

    rails generate headjs:install

Now just add headjs to your head, using default rails `javascript_include_tag('head.min')` for example, and put the rest of your scripts at the bottom of your layout with the `headjs_include_tag` method the gem provides. This method is a wrapper of `javascript_include_tag` and accepts the exact same methods, so it should work fine with any other gem/plugin that works with it.

    headjs_include_tag(:defaults)
    headjs_include_tag(:all)
    headjs_include_tag('http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js')
    headjs_include_tag('jquery', 'jquery.ui', 'jquery.plugin', 'rails')
    headjs_include_tag(:defaults, :cache => true)
    headjs_include_tag(:defaults, 'jquery.ui', :cache => 'bundle')

The sources will have labels automatically assigned based on the filename (removing .js, .min.js and any other parameter).

    headjs_include_tag('jquery', 'rails')
    # <script type="text/javascript">head.js( { 'jquery': '/javascripts/jquery.js?23495342' }, { 'rails': '/javascripts/rails.js?458292234' } );</script>
    
    headjs_include_tag(:defaults, :cache => 'bundle')
    # <script type="text/javascript">head.js( { 'bundle': '/javascripts/bundle.js' } );</script>

Don't forget to use `head.ready()` in any code that runs inside your views. More information in [Head JS API](http://headjs.com/#api).

I also suggest you take a look at the [smurf gem](https://github.com/thumblemonks/smurf), a drop-in gem that automatically minifies Javascript (and CSS) when you use caching and rails default include tag helpers. It works fine with `headjs_include_tag` as well as it's just a wrapper of `javascript_include_tag`.

## Testing

Clone the repo, run `bundle install` and `bundle exec rake test`.

## Contributing to headjs-rails

Fork the project and send pull requests.

## Copyright

Author: David Bittencourt. See LICENSE.txt for further details.

