require 'spec_helper'

describe FavoritesController do

  describe "GET 'switch'" do
    it "returns http success" do
      get 'switch'
      response.should be_success
    end
  end

end
