class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    @order = current_order
  	@date = format_date
  end

  def format_date
    date = Date._parse(Date.today.to_s)
  	day = date[:mday] 
  	month = Date::ABBR_MONTHNAMES[date[:mon]]
  	year = date[:year]  
  	"#{day} of #{month}, #{year}" 
  end
end
