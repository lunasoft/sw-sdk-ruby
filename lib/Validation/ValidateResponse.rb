require_relative '../Response.rb'
require 'net/http'
require 'json'

class ValidateResponse < Response
	def initialize(cResponse)
		set(cResponse)
	end
	def set(cResponse)
		begin
			@statusCode = cResponse.code
			@response = JSON.parse(cResponse.read_body)
			@status = @response['status']
			@data = @response['data']
			@message = @response['detail']
			@messageDetail = @response['messageDetail']
		rescue
		end
	end
end