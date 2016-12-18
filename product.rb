class Product
  attr_accessor :title, :price, :image, :product_code

  def initialize(args)
    @title = args[:title]
    @price = args[:price]
    @image = args[:image]
    @product_code = args[:product_code]
  end

end

