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
end
