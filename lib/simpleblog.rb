require "redcarpet"
require "rouge"

require_dependency "rouge/plugins/redcarpet"

class ArticleHTMLRender < Redcarpet::Render::HTML
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
  def self.render_article(id)
    article_content = File.open("app/articles/#{id.to_i}.md").read
    markdown = Redcarpet::Markdown.new(ArticleHTMLRender, fenced_code_blocks: true)

    markdown.render(article_content)
  end

  def self.list_articles(tag = "", in_progress = "true")
    articles_yml_result = YAML.load_file("app/articles/articles.yml")["articles"]
    articles = Article.build_list_of_articles(articles_yml_result)

    if tag.present?
      articles = articles.filter { |article| article.tags.include?(tag) }
    end

    articles = if in_progress == "true"
      articles.filter { |article| article.in_progress }
    else
      articles.filter { |article| !article.in_progress }
    end

    articles.sort_by(&:id).reverse!
  end
end
