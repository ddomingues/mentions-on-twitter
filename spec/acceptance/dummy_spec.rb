# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe "Homepage", type: :request do

  it 'should displayed with successfully', :vcr do
    visit root_path
    expect(page).to have_selector(".container .panel-heading", :text => "Tweets")
  end

end
