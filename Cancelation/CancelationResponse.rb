require_relative '../Response.rb'
require 'net/http'
require 'json'

class CancelationResponse < Response
	def initialize(cResponse)
		set(cResponse)
	end
	def set(cResponse)
		@statusCode = cResponse.code
		begin
			@response = JSON.parse(cResponse.read_body)
			@data = @response['data']
			@status = @response['status']
			@message = @response['message']
			@messageDetail = @response['messageDetail']
		rescue
		end
	end
end