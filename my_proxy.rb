# frozen_string_literal: true
require "rack/proxy"

module Rack
  class MyProxy < Rack::Proxy
    def perform_request(env)
      request = Rack::Request.new(env)
      backend = URI("https://www.google.com")
      env["HTTP_HOST"] = backend.host
      env["PATH_INFO"] = "/search?q=" + request.path.gsub(/\//, "")
      env["HTTP_COOKIE"] = ""
      super(env)
    end
  end
end
