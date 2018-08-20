require 'test_helper'

class SaleItemTest < ActiveSupport::TestCase

  setup do
    DatabaseCleaner.clean_with(:truncation)
  end

  test "total_item_price" do
    item = SaleItem.new(items_params)
    assert_equal(item.total_price, 20)
  end

  test "total_items" do
    2.times.each { |t| default_items_creator }
    assert_equal(SaleItem.total_items, 4)
  end

  test "total_amount" do
    2.times.each { |t| default_items_creator }
    assert_equal(SaleItem.total_amount, 8)
  end

  test "total_all_price" do
    2.times.each { |t| default_items_creator }
    assert_equal(default_items_creator.total_price, 40)
  end

end
