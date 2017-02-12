class Scraping
  def self.get_shop_name_and_address
    require 'net/http'
    require 'uri'
    require 'rexml/document'

    url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=f85c5e5ed3235ddc&large_area=Z011&&count=500&format=xml"))
    res = Net::HTTP.start(url.host, url.port){|http|
    http.get(url.path + "?" + url.query);
}
    doc = REXML::Document.new(res.body)
    doc.elements.each('results/shop/') {|i|Shop.create(shop_name: i.elements['name'].text ,address: i.elements['address'].text, area: i.elements['station_name'].text)}
  end
end