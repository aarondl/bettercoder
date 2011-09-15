class InstallController < ApplicationController
  before_filter :require_fresh_site

  def create
    SiteConfig.create(params[:siteconfig])
  end

  def new
    @siteinfo = SiteConfig.new
  end

  private

  def require_fresh_site
    redirect_to '/' if SiteConfig.first != nil
  end

end

