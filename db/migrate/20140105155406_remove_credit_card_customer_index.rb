class RemoveCreditCardCustomerIndex < ActiveRecord::Migration
  def change
  	remove_index(:credit_cards, name: :index_credit_cards_on_customer_id)
  end
end
