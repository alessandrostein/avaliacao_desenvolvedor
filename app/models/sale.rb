class Sale < ActiveRecord::Base
  has_many :items, class_name: 'SaleItem'

  default_scope { order(created_at: :desc) }

  def total_price
    self.items.map { |i| i.total_price }.sum
  end

  def total_amount
    self.items.sum(:amount)
  end

  def total_items
    self.items.count
  end

  def self.total_sales
    Sale.all.count
  end
end
