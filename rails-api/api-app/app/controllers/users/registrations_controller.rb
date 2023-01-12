# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'signup sucessfully', data: resource }
        }, status: :ok
      else
        render json: {
          status: { message: 'user not created', errors: resource.errors.full_messages }
        }, status: :unprocessable_entity
      end
    end
  end
end
