class HomeController < ApplicationController

  respond_to :html

  def index
    redirect_to mentions_url
  end

end