$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('support', __FILE__)

require 'deckbrew/ruby'
require_relative 'deckbrew/support/deckbrew_api_fake.rb'
require 'vcr'
require 'pry'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock 
end

Deckbrew::Config.api = Support::DeckbrewApiFake
