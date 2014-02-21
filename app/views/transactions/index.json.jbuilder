json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :purchaser_name, :description, :address, :merchant_name, :quantity, :price
  json.url transaction_url(transaction, format: :json)
end
