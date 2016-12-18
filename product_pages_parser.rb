require 'nokogiri'

class ProductPagesParser

  PRODUCT_PROPERTIES = [:title, :price, :image, :product_code].freeze
  FIELDS_MAP = {
      title: {
          value: :text,
          xpath: "//div[contains(@id, 'nestedContent__mainpageContent_ProductFamilyDetailsView1__detailCnt')]/h2",
      },
      price: {
          value: :text,
          xpath: "//span[contains(@id, 'nestedContent__mainpageContent_ProductFamilyDetailsView1__hasPriceItemView__priceValueLabel')]",
      },
      image: {
          value: :value,
          xpath: "//img[contains(@id, 'nestedContent__mainpageContent_ProductFamilyDetailsView1__productFamilyImagesView__mainImage')]/@src",
      },
      product_code: {
          value: :text,
          xpath: "//span[contains(@id, 'mainpageContent_ProductFamilyDetailsView1__itemCode')]",
      },
  }


  def initialize(raw_page)
    @doc = Nokogiri::HTML(raw_page)
  end

  def parse_product
    Product.new(get_data)
  end

  private

  def get_data
    product_properties = {}
    PRODUCT_PROPERTIES.each do |property|
      print "New record parsing started\n"
      product_properties[property] = @doc.at(FIELDS_MAP[property][:xpath]).public_send(FIELDS_MAP[property][:value])
      print "#{product_properties[property]} downloaded\n"
    end
    product_properties
  end

end
