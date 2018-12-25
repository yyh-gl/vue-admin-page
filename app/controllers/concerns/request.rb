module Request
  require 'net/http'

  def send_request(method, params = {})
    JSON.parse(Net::HTTP.get(create_uri(method, params)))
  end

  private

  def create_uri(method, params)
    URI.parse([ENV['API_SERVER_DOMAIN'], method].join).tap do |uri|
      uri.query = URI.encode_www_form({}.merge(params))
    end
  end
end