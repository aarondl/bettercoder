class Overlord::LogoutController < ApplicationController
  layout 'site'

  def dologout
    unless cookies.signed[:bcoder_lgn].nil?
      cookies.delete :bcoder_lgn
    end
    flash[:notice] = 'Successfully logged out.'
    redirect_to '/'
  end
end
