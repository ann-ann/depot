class Author < ActiveRecord::Base

  has_many :product_authors
  has_many :products, through: :product_authors

  validates :first_name, :last_name, presence: true
  validates :photo, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)}i,
    message: 'only jpg/png/gif image'
  }

  def to_s
    "#{first_name} #{last_name}"
  end
  
end
