require 'date'
class CreditCardValidator < ActiveModel::Validator
  def validate(record)
# TODO refactor it 
    yrs = []
    year_today = Date.today.strftime("%Y").to_i
    year_today.upto(year_today+10).each do |y| yrs << y.to_s; end

    unless (yrs.include?(record.exp_y.to_s) )
      record.errors[:exp_y] << 'Expiration year is invalid'
    end

    months =[]
    next_month = 1.month.from_now.strftime("%m").to_i
    next_month.upto(12).each do |m| months << m.to_s; end
  
    unless (months.include?(record.exp_m.to_s) )
      record.errors[:exp_m] << 'Expiration month is invalid'
    end
  end

end

class CreditCard < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :order

  validates :number ,:cvv, :exp_m, :exp_y, :fname, :lname, presence: :true
  validates_numericality_of :cvv, :exp_m, :exp_y
  validates_format_of :number, with: /\A\d{16}\z/ , message: 'Invalid carn num'
  validates :cvv, :length => { is: 3 }
  validates_inclusion_of :exp_m, :in => 1..12 
  validates :exp_y, :length => { is: 4 }

  validates_with CreditCardValidator
end
