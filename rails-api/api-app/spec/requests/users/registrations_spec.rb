require "swagger_helper"

RSpec.describe "users/registrations", type: :request do
  path "/users" do
    post("create registration") do
      tags "Registrations"
      consumes "application/json"
      produces "application/json"
      parameter name: :user, in: :body, schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        email: { type: :string },
                        password: { type: :string },
                      },
                    },
                  },
                  required: ["user", "email", "password"],
                }
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
      response(422, "Unprocessable Entity") do
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
