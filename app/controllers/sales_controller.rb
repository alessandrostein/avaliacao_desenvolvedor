# encoding: UTF-8
class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def import
    sale = Sale.new
    File.read(params[:file].path, :encoding => "UTF-8", headers: false).each_line.with_index do |line, index|
      next if index == 0      
      data = line.split("\t")
      buyer, description, price, amount, address, vendor = data.map{ |d| d }.flatten
      item = SaleItem.new
      item.buyer = buyer
      item.description = description
      item.price = price
      item.amount = amount
      item.address = address
      item.vendor = vendor
      sale.items << item
    end
    sale.save

    redirect_to sale_path(sale)
  end

end
