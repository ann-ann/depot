require 'date'
class CreditCardValidator < ActiveModel::Validator
  def validate(record)
    current_month = Date.today.strftime("%m").to_i
    current_year = Date.today.strftime("%Y").to_i

    if record.exp_y.eql? current_year
      puts "year is current"
      if record.exp_m <= current_month
        puts "month is current"
        record.errors[:exp_m] << 'Expiration date of your card should be at least next month'
      end
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
