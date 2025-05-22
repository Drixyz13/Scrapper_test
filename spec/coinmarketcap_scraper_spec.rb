# spec/coinmarketcap_scraper_spec.rb
require_relative '../lib/dark_trader'
require 'spec_helper'

RSpec.describe 'coinmarketcap_scraper' do
  it 'returns an array' do
    results = coinmarketcap_scraper
    expect(results).to be_an(Array)
  end

  it 'returns an array of hashes' do
    results = coinmarketcap_scraper
    expect(results).to all(be_a(Hash))
  end

  it 'each hash contains one key-value pair with symbol (String) and price (Float)' do
    results = coinmarketcap_scraper
    results.each do |crypto|
      expect(crypto.size).to eq(1)
      key = crypto.keys.first
      value = crypto.values.first
      expect(key).to be_a(String)
      expect(value).to be_a(Float)
      expect(value).to be > 0
    end
  end
end
