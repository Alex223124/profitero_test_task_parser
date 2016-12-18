require 'nokogiri'

class CategoryProductsParser

  CATEGORY_PRODUCTS = {__EVENTTARGET: 'ctl00$ctl00$_nestedContent$_pagingPlaceHolder$_pagingTop1Type2$_showAll'}
  PRODUCT_XPATH = '//li[starts-with(@class, "rela")]/a'

  def initialize(url)
    category_page = Curl.post(url, CATEGORY_PRODUCTS)
    @category_doc = Nokogiri::HTML(category_page.body)
  end


  def parse_pages(file)
    parsed_products = []
    @category_doc.xpath(PRODUCT_XPATH).each do |product|
      raw_html = PageLoader.new(product['href']).load_page
      parsed_product = ProductPagesParser.new(raw_html).parse_product
      parsed_products << parsed_product
    end
    FileWriter.new(parsed_products, file).write_to_csv
  end
end