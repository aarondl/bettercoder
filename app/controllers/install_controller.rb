class InstallController < ApplicationController
  before_filter :require_fresh_site

  def create
    @siteinfo = SiteConfig.new(params[:site_config])
    render :new unless @siteinfo.save
  end

  def new
    @siteinfo = SiteConfig.new if @siteinfo == nil
  end

  private

  def require_fresh_site
    redirect_to '/' if SiteConfig.first != nil
  end

end

