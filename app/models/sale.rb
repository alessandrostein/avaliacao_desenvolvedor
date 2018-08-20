class Sale < ActiveRecord::Base
  has_many :items, class_name: 'SaleItem'

  default_scope { order(created_at: :desc) }
end
