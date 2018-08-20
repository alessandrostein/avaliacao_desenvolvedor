class SaleItem < ActiveRecord::Base
  belongs_to :sale

  def total_price
    self.price * self.amount
  end

  def self.total_items
    SaleItem.all.count
  end

  def self.total_amount
    SaleItem.sum(:amount)
  end

  def self.total_price
    SaleItem.all.map { |i| i.total_price }.sum
  end
end
