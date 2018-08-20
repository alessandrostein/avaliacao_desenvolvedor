# encoding: UTF-8
class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def import
    if params[:file].nil?
      flash[:danger] = "Por favor, selecione o arquivo."
      redirect_to new_sale_path
      return
    end
    flash[:success] = "Dados importado com sucesso."
    @sale = Sale.new
    normalize_items.each do |item|
      @sale.items << SaleItem.new(item)
    end
    @sale.save
  end

  private

  def normalize_items
    Service::SaleFileNormalize.new(params[:file]).resolver
  end

end
