class Overlord::DashboardController < ApplicationController
  def index
    s = SiteConfig.first
    if s.nil? || cookies.signed[:bcoder_lgn] != s.salt 
      redirect_to '/'
    end
  end
end
