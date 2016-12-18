require 'csv'

class FileWriter

  def initialize(parsed_products, file)
    @parsed_products = parsed_products
    @file = file
  end

  def write_to_csv
    CSV.open(@file, "w") do |csv|
      @parsed_products.map.with_index do |product, index|
        csv << ["Record № #{index + 1})"]
        csv << ["title: #{product.title}"]
        csv << ["price: #{product.price}"]
        csv << ["image: #{product.image}"]
        csv << ["product code: #{product.product_code}"]
      end
    end
    check_file
  end

  private

  def check_file
    if File.file?(@file)
      print "#{@file} updated\n"
    end
  end

end