require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.create :product}
  let(:product_with_ratings) { FactoryGirl.create :product_with_ratings}
  let(:product_with_refs) { FactoryGirl.create :product_with_refs}

  context "validations" do
    it { expect(product).to validate_presence_of(:title) }

    it { expect(product).to validate_uniqueness_of(:title) }

    it do 
      expect(product).to ensure_length_of(:title).is_at_least(10).
      with_message('Title have to be not less that 10 chars long') 
    end

    it { expect(product).to validate_presence_of(:description) }

    it { expect(product).to validate_presence_of(:image_url) }

    it do 
      expect(product).to allow_value('ann.jpg, valid_img.png, valig.gif, smthg.JPG, http://a.b.c/lalal.png').
      for(:image_url) 
    end

    it do 
      expect(product).not_to allow_value('ann.doc, invalid_img, valig.txt, smthg.p_n_g, http://a.b.c/lalal_png').
      for(:image_url) 
    end

    it do 
      expect(product).to validate_numericality_of(:price).
      with_message('Price have to be not less that 0.01') 
    end

    it do 
      expect(product).to validate_numericality_of(:price)
      .is_greater_than_or_equal_to(0.01).with_message('Price have to be not less that 0.01') 
    end

    it { expect(product).to validate_numericality_of(:in_stock).is_greater_than_or_equal_to(0) }
  end

  context "assosiations" do
    it { expect(product).to have_many(:authors).through(:product_authors) }

    it { expect(product).to have_many(:ratings) }

    it { expect(product).to have_many(:types).through(:product_types) }

    it { expect(product).to have_many(:order_items) }
  end

  context ".in_stock scope" do
    let(:products_in_stock) { FactoryGirl.create_list(:product_in_stock, 4) }
    let(:products_out_of_stock) { FactoryGirl.create_list(:product_out_of_stock, 3) }

    it {expect(Product.in_stock).to match_array(products_in_stock)}
    it {expect(Product.in_stock).not_to match_array(products_out_of_stock)}
  end
  
  context ".in_stock? method" do
    let(:product_in_stock) { FactoryGirl.create :product_in_stock }
    let(:product_out_of_stock) { FactoryGirl.create :product_out_of_stock }

    it {expect(product_in_stock).to be_in_stock}
    it {expect(product_out_of_stock).not_to be_in_stock}
  end


  context ".ensure_no_refs_by_any_order_item" do
    it "cannot be deleted if there any order items related to product" do
      expect{ product_with_refs.destroy }.to_not change{ product_with_refs }
    end

# TODO fix
    it "delete product if no items referenced to it" do
      # product_with_refs.order_items.delete_all
      # expect{ product_with_refs.destroy }.to change{ product_with_refs }
    end
  end

  context ".get_rating" do
    it "says that product havent been rated if no ratings" do
      expect(product.get_rating).to be_eql('havent been rated yet')
    end
    # фактически дублируется метод в тесте. как бы переписать?
    it " returns average value of all ratings" do
      r =  product_with_ratings.ratings.to_a.sum { |r| r.rating } / product_with_ratings.ratings.count
      expect(product_with_ratings.get_rating).to be_eql(r)
    end
  end
end
