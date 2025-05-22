require 'spec_helper'
require_relative '../lib/mairie_christmas'

describe 'Mairie Christmas scraper' do
  it 'returns an array of URLs' do
    urls = get_townhall_urls
    expect(urls).to be_an(Array)
    expect(urls.first).to include('val-d-oise')
  end

  # tu peux ajouter d’autres tests pour get_townhall_email etc.
end