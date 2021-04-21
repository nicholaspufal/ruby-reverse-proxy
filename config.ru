# frozen_string_literal: true
require_relative "my_proxy"

use Rack::MyProxy, backend: "https://www.google.com"

run ->(env) { [200, {"Content-Type" => "text/html"}, ["This content won't load"]] }
