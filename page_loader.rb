require 'curb'

class PageLoader

  def initialize(url)
    @url = url
  end

  def load_page
    page = Curl.get(@url)
    page.body_str
  end
end