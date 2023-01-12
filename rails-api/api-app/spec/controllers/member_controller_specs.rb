require "rails_helper"

RSpec.describe MembersController, type: :request do
  let(:valid_attributes) do
    {
      "email" => "abc@mail.com",
      "password" => "123456",
      "name" => "pratik",
      "age" => "26",
      "bio" => "Born in Pune",
    }
  end
  context "members /index" do
    it "login as user it shoild return all the users" do
      @user = create_list(:user, 10)
      sign_in(@user[0])
      get "/members"
      expect(response).to have_http_status(:success)
      result = JSON.parse(response.body)
      expect(result.count).to eq 10
    end
  end

  context "PATCH update" do
    let(:user) { create :user }
    it "should update user with all params" do
      sign_in(user)
      patch "/members/#{user.id}", params: {
                                     user: {
                                       name: "Pratik Baravkar",
                                       email: "prb@gmail.com",
                                       password: "1234567",
                                       age: "26",
                                       bio: "born in pune",
                                     }, id: user.id,
                                   }
      #debugger
      expect(response).to have_http_status(:success)
    end
  end

  context "Delete destroy" do
    let(:user) { create :user }
    it "should delete user" do
      sign_in(user)
      delete "/members/#{user.id}"
      #debugger
      expect(response).to have_http_status(:success)
    end
  end

  context "Fetch User" do
    let(:user) { create :user }
    it "should delete user" do
      sign_in(user)
      get "/members/#{user.id}"
      #debugger
      expect(response).to have_http_status(:success)
    end
  end
end
