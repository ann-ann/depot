class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders

  validates :email, :first_name, :last_name, :password, presence: :true
end
