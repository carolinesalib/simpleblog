class HomeController < ApplicationController
  before_action :set_site_prefix

  def index
  end

  private

  def set_site_prefix
    @title_prefix = "About | "
  end
end
