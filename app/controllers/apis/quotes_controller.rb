class Apis::QuotesController < ApplicationController
  def index
    command = GetQuote.call()

    if command.success?
      quote = command.result
      rating = quote.ratings.find_or_create_by(ip_address: request.remote_ip)
      render json: {quote: quote, rating: rating, average_rating: quote.average_rating}
    else
      render json: {error: "Unable to process at this time", status: 400}, status: :bad_request
    end
  end

  def update_rating
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
