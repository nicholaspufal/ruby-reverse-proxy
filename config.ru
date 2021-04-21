# frozen_string_literal: true
require_relative "app"

use Rack::MyProxy, backend: "https://www.google.com"

run Rack::MyApp.new
