require 'rails_helper'

RSpec.describe UpdateRating, type: :model do
  subject { 
    described_class.call(id, stars)
  }
  let(:id) {4}
  let(:stars) {4}
  let(:quote) {Quote.create(id: 1, title: "This title")}
  let(:rating) {Rating.create(id: id, stars: 3, quote_id: quote.id)}

  it "returns a Rating" do
    rating
    expect(subject.result).to be_an_instance_of(Rating)
  end

end
