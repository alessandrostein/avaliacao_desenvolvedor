class Service::SaleFileNormalize

  def initialize(file)
    @file = file.path
  end

  def resolver
    items
  end

  private

  def read
    File.read(@file, :encoding => "UTF-8")
  end

  def items
    items = []
    read.each_line.with_index do |line, index|
      next if index == 0
      data = line.split("\t")
      buyer, description, price, amount, address, vendor =
        data.map{ |d| d }.flatten
      items << {
        buyer: buyer,
        description: description,
        price: price,
        amount: amount,
        address: address,
        vendor: vendor
      }
    end
    items
  end

end
