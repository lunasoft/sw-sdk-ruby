require 'net/http'
require 'uri'
require 'json'
require 'securerandom'

class RequestHelper
  class << self
    def get_json_request(endpoint, token)
      headers = json_headers(token)
      send_request(:get, endpoint, headers)
    end

    def post_json_request(endpoint, token, payload = {})
      headers = json_headers(token)
      send_request(:post, endpoint, headers, payload.to_json)
    end

    def post_json_request_without_token(endpoint, payload)
      headers = {'Content-Type': 'application/json', 'Cache-Control': "no-cache"}
      send_request(:post, endpoint, headers, payload.to_json)
    end

    def put_json_request(endpoint, token, payload = {})
      headers = json_headers(token)
      send_request(:put, endpoint, headers, payload.to_json)
    end

    def delete_json_request(endpoint, token, payload = {})
      headers = json_headers(token)
      send_request(:delete, endpoint, headers, payload.to_json)
    end

    def post_jsontoxml_request(endpoint, token, payload)
      headers = {
        'Authorization' => "Bearer #{token}",
        'Content-Type' => 'application/jsontoxml; charset=utf-8',
        'Cache-Control' => 'no-cache'
      }
      send_request(:post, endpoint, headers, payload.to_s.encode('utf-8'))
    end

    def post_multipart_request(endpoint, token, xml_data)
      boundary = SecureRandom.alphanumeric(30)
      headers = {
        'Authorization' => "Bearer #{token}",
        'Content-Type' => "multipart/form-data; boundary=#{boundary}"
      }
      body = build_multipart_body(xml_data, boundary)
      send_request(:post, endpoint, headers, body)
    end

    private

    def json_headers(token)
      {
        'Authorization' => "Bearer #{token}",
        'Content-Type' => 'application/json',
        'Cache-Control' => 'no-cache'
      }
    end

    def build_multipart_body(xml, boundary)
      [
        "--#{boundary}",
        "Content-Type: text/xml",
        "Content-Transfer-Encoding: binary",
        'Content-Disposition: form-data; name="xml"; filename="xml"',
        '',
        xml.to_s,
        "--#{boundary}--"
      ].join("\r\n")
    end

    def send_request(method, endpoint, headers = {}, body = nil)
      uri = endpoint.is_a?(URI) ? endpoint : URI.parse(endpoint)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = build_http_request(method, uri)
      headers.each { |k, v| request[k] = v }
      request.body = body if body

      http.request(request)
    end

    def build_http_request(method, uri)
      case method.to_s.downcase
      when 'get'    then Net::HTTP::Get.new(uri)
      when 'post'   then Net::HTTP::Post.new(uri)
      when 'put'    then Net::HTTP::Put.new(uri)
      when 'delete' then Net::HTTP::Delete.new(uri)
      else raise ArgumentError, "Unsupported method: #{method}"
      end
    end
  end
end
