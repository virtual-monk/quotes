class GetQuote
  prepend SimpleCommand

  def initialize()
    @client = RonSwanson::V2::Client.new
  end

  def call
    quote = @client.get_quote
    if quote = Quote.find_or_create_by(title: quote[0])
      return quote
    else
      errors.add(:base, :failure)
    end
  end
end