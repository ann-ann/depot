require 'spec_helper'

describe CreditCard do
  let(:credit_card) {FactoryGirl.create :credit_card}
  let(:current_year_expiration_card) {FactoryGirl.create :current_year_expiration_card}

  context "presence validation for all attributes" do
    it { expect(credit_card).to validate_presence_of(:fname) }
    it { expect(credit_card).to validate_presence_of(:lname) }
    it { expect(credit_card).to validate_presence_of(:number) }
    it { expect(credit_card).to validate_presence_of(:cvv) }
    it { expect(credit_card).to validate_presence_of(:exp_m) }
    it { expect(credit_card).to validate_presence_of(:exp_y) }
  end

  context ".number validation" do
    it "valid only with 16 chars long numerical value" do
      expect(credit_card).to allow_value(credit_card.number).for(:number).
      with_message('Invalid carn num')
    end
    it "invalid with not integer chars" do
      expect(credit_card).not_to allow_value("123412341234123a").for(:number).
      with_message('Invalid carn num')
    end
    it "invalid with length less than 16 chars" do
      expect(credit_card).not_to allow_value("123412341234123").for(:number).
      with_message('Invalid carn num')
    end
    it "invalid with length more than 16 chars" do
      expect(credit_card).not_to allow_value("12341234123412356").for(:number).
      with_message('Invalid carn num')
    end
  end
  
  context ".cvv validation" do
    it "invalid with not integer chars" do
      expect(credit_card).to validate_numericality_of(:cvv)
    end
    it "accept values only 3 chars long" do
      expect(credit_card).to allow_value("123").for(:cvv)
      expect(credit_card).not_to allow_value("1234").for(:cvv)
      expect(credit_card).not_to allow_value("14").for(:cvv)
    end
  end

  context "expiration date " do
    it "accept only numbers" do
      expect(credit_card).to validate_numericality_of(:exp_m)
      expect(credit_card).to validate_numericality_of(:exp_y)
    end

    it "accept month value between 1 and 12" do
      expect(credit_card).to ensure_inclusion_of(:exp_m).in_range(1..12) 
    end

    it "accept year value only 4 chars long" do
      expect(credit_card).to allow_value(2018).for(:exp_y)
      expect(credit_card).not_to allow_value(201).for(:exp_y)
      expect(credit_card).not_to allow_value(20188).for(:exp_y)
    end

    it "doesnt accept year before current " do
      expect(credit_card).not_to allow_value(2013).for(:exp_y).
      with_message('Expiration year is invalid')
    end

    it " doesnt accept year after next 10 years" do
      expect(credit_card).not_to allow_value(2026).for(:exp_y).
      with_message('Expiration year is invalid')
    end

    it "accept current year" do
      expect(credit_card).to allow_value(Date.today.strftime("%Y").to_i).for(:exp_y)
    end

    it "doesnt accept current month and year as expiration date" do
      expect(current_year_expiration_card).not_to allow_value(Date.today.strftime("%m").to_i).for(:exp_m).
      with_message('Expiration month is invalid')
    end

    it "accept current expiration year and next month" do
      expect(current_year_expiration_card).to allow_value(1.month.from_now.strftime("%m").to_i).for(:exp_m)
    end

  end

  context "assosiations" do
    it { expect(credit_card).to belong_to(:order) }
  end

end



