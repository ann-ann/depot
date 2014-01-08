class Author < ActiveRecord::Base
# Should have many books
  has_many :product_authors
  has_many :products, through: :product_authors

# Should contain firstname, lastname, photo, biography
  validates :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
  
end
