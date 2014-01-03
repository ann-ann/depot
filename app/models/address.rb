class Address < ActiveRecord::Base
	has_one :country
	belongs_to :order
end
