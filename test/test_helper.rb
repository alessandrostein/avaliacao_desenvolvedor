ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def default_items_creator
    sale = Sale.create
    sale.items << SaleItem.new(items_params)
    sale.items << SaleItem.new(items_params)
    sale.save
    sale
  end

  def items_params
    {
      buyer: 'Buyer',
      description: 'Description',
      price: 10,
      amount: 2,
      address: 'Address',
      vendor: 'Vendor'
    }
  end
end
