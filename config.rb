# activate :directory_indexes
#
set :css_dir,    'assets/css'
set :js_dir,     'assets/js'
set :images_dir, 'assets/img'

###
## Compass
####
#
## Susy grids in Compass
require 'susy'

##
#
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Methods defined in the helpers block are available in templates
helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year =  Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end

  def img_holder(opts ={})
    return "Missing Image Dimension(s)" unless opts[:width] && opts[:height]
    return "Invalid Image Dimension(s)" unless opts[:width].to_s =~ /^\d+$/ && opts[:height].to_s =~ /^\d+$/
    img  = "<img data-src=\"holder.js/#{opts[:width]}x#{opts[:height]}/auto"
    img << "/#{opts[:bgcolor]}:#{opts[:fgcolor]}" if opts[:fgcolor] && opts[:bgcolor]
    img << "/text:#{opts[:text].gsub(/'/,"\'")}" if opts[:text]
    img << "\" width=\"#{opts[:width]}\" height=\"#{opts[:height]}\">"
    img
  end

end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # Use relative URLs
  activate :relative_assets

  # Enable cache buster
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"



#  activate :favicon_maker do |f|
#    f.template_dir  = File.join(root, 'source')
#    f.output_dir    = File.join(root, 'build')
#    f.icons = {
#      "_favicon_template_hires.png" => [
#        { icon: "apple-touch-icon-152x152-precomposed.png" },
#        { icon: "apple-touch-icon-114x114-precomposed.png" },
#        { icon: "apple-touch-icon-72x72-precomposed.png" },
#        { icon: "mstile-144x144", format: :png },
#        { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
#      ],
#      "_favicon_template_lores.png" => [
#        { icon: "favicon.png", size: "16x16" },
#        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
#      ]
#    }
#  end


end
activate :livereload
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-41495968-1'
end


activate :deploy do |deploy|
    deploy.method = :git
    deploy.branch = 'gh-pages'
end
