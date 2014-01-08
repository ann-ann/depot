class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders

  validates :email, :first_name, :last_name, :password, presence: :true
  validates :email, uniqueness: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
end
