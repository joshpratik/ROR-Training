# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "should validate name presence" do
    user = User.create()
    byebug
    expect(user).to eq(true)
  end
end
