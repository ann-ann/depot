json.array!(@credit_cards) do |credit_card|
  json.extract! credit_card, :id, :number, :cvv, :exp_m, :exp_y, :fname, :lname, :customer_id, :order_id
  json.url credit_card_url(credit_card, format: :json)
end
