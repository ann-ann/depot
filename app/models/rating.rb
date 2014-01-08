class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer

  validates :rating, presence: true, numericality: {only_integer: true}, :inclusion => {:in => 1..10}
end
