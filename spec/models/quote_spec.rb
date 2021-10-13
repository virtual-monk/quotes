require 'rails_helper'

RSpec.describe Quote, type: :model do
  subject { 
    described_class.create(title: "A great quote from a great man")
  }


  it "is valid when given correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "to have a correct average of ratings" do
    subject.ratings.create(ip_address: "1.1.1.1", stars: 1)
    subject.ratings.create(ip_address: "2.2.2.2", stars: 4)
    subject.ratings.create(ip_address: "3.3.3.3", stars: 3)
    expect(subject.average_rating).to eq(2.7)
  end
end
