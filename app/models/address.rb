class Address < ActiveRecord::Base
	belongs_to :country
	belongs_to :order
end
