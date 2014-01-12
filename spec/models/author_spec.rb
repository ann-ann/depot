require 'spec_helper'

describe Author do
  
  let(:author) { FactoryGirl.create :author}

  context "validations" do
    it { expect(author).to validate_presence_of(:first_name) }
    it { expect(author).to validate_presence_of(:last_name) }
    it do 
      expect(author).to allow_value('ann.jpg, valid_img.png, valig.gif, smthg.JPG, http://a.b.c/lalal.png').
      for(:photo) 
    end
    it do 
      expect(author).not_to allow_value('ann.doc, invalid_img, valig.txt, smthg.p_n_g, http://a.b.c/lalal_png').
      for(:photo) 
    end
    it { expect(author).to allow_value('').for(:photo) } 
  end
  context "associations" do
    it { expect(author).to have_many(:products).through(:product_authors) }
  end
# Need to test simple to_s method?
end
