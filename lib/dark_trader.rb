require 'nokogiri'
require 'open-uri'

def coinmarketcap_scraper
  url = 'https://coinmarketcap.com/all/views/all/'
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)

  results = []

  doc.css('tbody tr').first(100).each do |row|
    symbol = row.at_css('td.cmc-table__cell--sort-by__symbol > div')&.text&.strip
    price_text = row.at_css('td.cmc-table__cell--sort-by__price span')&.text&.strip

    next if symbol.nil? || price_text.nil?

    price = price_text.gsub(/[^\d\.]/, '').to_f
    results << { symbol => price }
    puts "#{symbol} - #{price}$"
  end

  puts "\n✅ Total cryptos récupérées : #{results.size}"
  results
end

coinmarketcap_scraper