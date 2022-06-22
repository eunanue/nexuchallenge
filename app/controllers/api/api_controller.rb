module Api
    class Api::ApiController < ActionController::Base
      skip_before_action :verify_authenticity_token
      rescue_from ActiveRecord::RecordNotFound, with: :handle_error

      private

      def handle_error(e)
        render json: { error: e.to_s }, status: :bad_request
      end
      
    end
end
  