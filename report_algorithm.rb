require_relative 'page_loader'
require_relative 'product_pages_parser'
require_relative 'file_writer'
require_relative 'product'
require_relative "category_products_parser"
require 'pry'

require 'rubygems'
require 'bundler/setup'

class ReportAlgorithm

  def initialize(url, file)
    @url = url
    @file = file
  end

  def build
    CategoryProductsParser.new(@url).parse_pages(@file)
  rescue Exception => e
    puts e.message
  end
end