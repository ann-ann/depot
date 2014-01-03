json.array!(@orders) do |order|
  json.extract! order, :id, :total_price, :state, :completed_at, :bill_address, :ship_address
  json.url order_url(order, format: :json)
end
