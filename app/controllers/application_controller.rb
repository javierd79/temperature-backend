# frozen_string_literal: true

class ApplicationController < ActionController::API
  def refresh
    ActionCable.server.broadcast('status', { message: Time.now.to_i })
    render json: { message: "Ok!" }, status: :ok
  end
end
