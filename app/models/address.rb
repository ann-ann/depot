class Address < ActiveRecord::Base
	belongs_to :country
	belongs_to :order

	validates_presence_of :address, :zipcode, :city, :phone
end
