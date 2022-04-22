class BlogController < ApplicationController
  include SimpleBlogHelper

  before_action :set_site_prefix

  def index
    @posts = SimpleBlog.list_posts(params[:tag], params[:in_progress])
  end

  def show
    @post_content_html = SimpleBlog.render_post(params[:id])
  end
end
