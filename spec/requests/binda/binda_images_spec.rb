require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "GET /binda_images" do
    it "works! (now write some real specs)" do
      get binda_images_path
      expect(response).to have_http_status(200)
    end
  end
end
