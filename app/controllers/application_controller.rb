class ApplicationController < ActionController::API
  def four_oh_four
    render json: {error: 'not-found'}, status: 404
  end
end
