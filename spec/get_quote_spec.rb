require 'rails_helper'

RSpec.describe GetQuote, type: :model do
  subject { 
    described_class.call()
  }

  it "returns an instance of Quote" do
    expect(subject.result).to be_an_instance_of(Quote)
  end
end
