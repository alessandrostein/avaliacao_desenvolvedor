require 'test_helper'

class SaleTest < ActiveSupport::TestCase

  setup do
    DatabaseCleaner.clean_with(:truncation)
  end

  test "create" do
    sale = Sale.create
    assert sale.persisted?
  end

  test "total_sales" do
    2.times.each { |t| Sale.create }
    assert_equal(Sale.total_sales, 2)
  end

  test "total_price" do
    assert_equal(default_items_creator.total_price, 40)
  end

  test "total_amount" do
    assert_equal(default_items_creator.total_amount, 4)
  end

  test "total_items" do
    assert_equal(default_items_creator.total_items, 2)
  end    

end
