class HomeController < ApplicationController

  respond_to :html

  def index
    @tweets = Twitter::Api::ClientService.search
    # puts @tweets.to_json
  end

end