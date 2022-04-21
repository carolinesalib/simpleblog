require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"
require "simpleblog/post"
require "simpleblog/railtie" if defined?(Rails) && defined?(Rails::Railtie)

module SimpleBlogHelper
  def set_site_prefix
    @title_prefix = "#{params["controller"].capitalize} | "
  end
end

class PostHTMLRender < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
  include ActionView::Helpers::AssetTagHelper

  def image(link, title, alt_text)
    if title =~ /=(\d+)x(\d+)/
      %(<img src="#{ActionController::Base.helpers.asset_path(link)}" alt="#{alt_text}" class="markdown-image" style="max-width: #{$1}px; max-height:#{$2}px">)
    else
      %(<img src="#{ActionController::Base.helpers.asset_path(link)}" alt="#{alt_text}" class="markdown-image">)
    end
  end
end

class SimpleBlog
  def self.render_post(id)
    post_content = File.open("app/posts/#{id.to_i}.md").read
    markdown = Redcarpet::Markdown.new(PostHTMLRender, fenced_code_blocks: true)

    markdown.render(post_content)
  end

  def self.list_posts(tag = "", in_progress = "true")
    posts_yml_result = YAML.load_file("app/posts/posts.yml")["posts"]
    posts = Post.build_list_of_posts(posts_yml_result)

    if tag.present?
      posts = posts.filter { |post| post.tags.include?(tag) }
    end

    posts = if in_progress == "true"
      posts.filter { |post| post.in_progress }
    else
      posts.filter { |post| !post.in_progress }
    end

    posts.sort_by(&:id).reverse!
  end
end
