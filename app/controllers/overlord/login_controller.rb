class Overlord::LoginController < ApplicationController
  layout 'site'

  def index
    unless cookies.signed[:bcoder_lgn].nil?
      redirect_to '/'
    end
    @siteconfig = SiteConfig.new
  end

  def dologin
    authority = SiteConfig.first
    siteconfig = SiteConfig.new(params[:site_config])
    if SiteConfig::verify_password(authority, siteconfig)
      cookies.permanent.signed[:bcoder_lgn] = authority.salt
      redirect_to '/overlord/dashboard'
    else
      flash[:notice] = "Wrong e-mail address or password."
      render :index
    end
  end
end
