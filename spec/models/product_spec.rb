require 'spec_helper'
 
describe Product do
  let(:product) { FactoryGirl.create :product}

  context "validations" do
    it { expect(product).to validate_presence_of(:title) }

    it { expect(product).to validate_uniqueness_of(:title) }

    it do expect(product).to ensure_length_of(:title).is_at_least(10).
      with_message('Title have to be not less that 10 chars long') 
    end

    it { expect(product).to validate_presence_of(:description) }

    it { expect(product).to validate_presence_of(:image_url) }

    it do expect(product).to allow_value('ann.jpg, valid_img.png, valig.gif, smthg.JPG, http://a.b.c/lalal.png').
      for(:image_url) 
    end

    it do expect(product).not_to allow_value('ann.doc, invalid_img, valig.txt, smthg.p_n_g, http://a.b.c/lalal_png').
      for(:image_url) 
    end

    it do expect(product).to validate_numericality_of(:price).
      with_message('Price have to be not less that 0.01') 
    end

    it do expect(product).to validate_numericality_of(:price)
      .is_greater_than_or_equal_to(0.01).with_message('Price have to be not less that 0.01') 
    end
  end

  context "assosiations" do
    it { expect(product).to have_many(:categories) }

    it { expect(product).to have_many(:authors) }

    it { expect(product).to have_many(:ratings) }

    it { expect(product).to have_many(:types) }
  end

  context ".in_stock" do
    let(:products_in_stock) { FactoryGirl.create_list(:product_in_stock, 4) }
    let(:products_out_of_stock) { FactoryGirl.create_list(:product_out_of_stock, 3) }

    it {expect(Product.in_stock).to match_array(products_in_stock)}
    it {expect(Product.in_stock).not_to match_array(products_out_of_stock)}
  end

# expect{Counter.increment}.to change{Counter.count}.from(0).to(1)
  

end


