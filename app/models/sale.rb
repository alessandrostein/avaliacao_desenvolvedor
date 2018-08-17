class Sale < ActiveRecord::Base
  has_many :items, class_name: 'SaleItem'
end
