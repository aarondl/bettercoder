class InstallController < ApplicationController
  before_filter :require_fresh_site

  def create
    @siteconfig = SiteConfig.new(params[:site_config])
    render :new unless @siteconfig.save
  end

  def new
    @siteconfig = SiteConfig.new if @siteconfig == nil
  end

  private

  def require_fresh_site
    redirect_to '/' if SiteConfig.first != nil
  end

end

