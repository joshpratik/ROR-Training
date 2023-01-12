require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Mambers" do
  get "/members" do
    example "Listing users" do
      do_request

      expect(status).to eq 200
    end
  end
end
