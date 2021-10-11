class Rating < ApplicationRecord
	validates :stars, :inclusion => { :in => 0..5 }
	validates :quote_id, uniqueness: { scope: :ip_address}
	belongs_to :quote
end
