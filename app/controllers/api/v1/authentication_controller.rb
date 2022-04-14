# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < BaseController
      def create
        @user = login(params[:email], params[:password])
        if @user
          json_string = UserSerializer.new(@user).serialized_json
          render json: json_string
        else
          response = {
            message: 'Record Not Found',
            errors: ['ActiveRecord::RecordNotFound']
          }
          render json: response, status: :not_found
        end
      end
    end
  end
end