class Address < ActiveRecord::Base
  belongs_to :country

  validates_presence_of :address, :zipcode, :city, :phone

  def to_s
   "#{address}, #{city}, #{zipcode}, #{phone}"

  end 

end
