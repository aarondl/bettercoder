class InstallController < ApplicationController
  before_filter :require_fresh_site

  def index
  end

  def new
  end

  private

  def require_fresh_site
    redirect_to '/' if SiteConfig.first != nil
  end

end

