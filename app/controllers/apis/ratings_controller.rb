class Apis::RatingsController < ApplicationController
  def update
    command = UpdateRating.call(params[:rating_id], params[:rating])
    if command.success?
      rating = command.result
      render json: {rating: rating, average_rating: rating.quote.average_rating }
    else
      render json: {error: "Unable to process at this time", status: 400}, status: :bad_request
    end
  end

  private

  def quotes_params
    params.permit(:rating_id, :rating)
  end
end
