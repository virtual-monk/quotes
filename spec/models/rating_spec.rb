require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject{
    described_class.create(stars: 3, quote_id: quote.id, ip_address: "1.1.1.1")
  }

  let(:quote) { Quote.create(title: "A great quote from a great man") }
  let(:duplicate_ip) { described_class.create(stars: 3, quote_id: quote.id, ip_address: "1.1.1.1") }


  it "is valid when given correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid if with a number greater than 5" do
    subject.stars = 10
    expect(subject).to_not be_valid
  end

  it "is not valid if with a number less than 0" do
    subject.stars = -10
    expect(subject).to_not be_valid
  end

  it "is not valid if the ip_address has already rated the same quote" do
    subject
    expect(duplicate_ip).to_not be_valid
  end
end
