require "swagger_helper"
#require "rails-helper"

RSpec.describe "members", type: :request do
  let(:access_token) { FactoryBot.create(:api_key).access_token }
  let(:Authorization) { "Bearer #{access_token}" }

  path "/members" do
    get("list members") do
      tags "Members"
      consumes "application/json"
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
      response(401, "Unauthorized") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  path "/members/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id", in: :path, type: :string, description: "id"

    get("show member") do
      tags "Members"
      consumes "application/json"
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    patch("update member") do
      tags "Members"
      consumes "application/json"
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              bio: { type: :string },
              age: { type: :string },
              password: { type: :string },
            },
          },
        },
        required: ["user", "password"],
      }
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    put("update member") do
      tags "Members"
      consumes "application/json"
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              bio: { type: :string },
              age: { type: :string },
              password: { type: :string },
            },
          },
        },
        required: ["user", "password"],
      }
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    delete("delete member") do
      tags "Members"
      consumes "application/json"
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
