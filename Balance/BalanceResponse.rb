require_relative '../Response.rb'
require 'net/http'
require 'json'

class BalanceResponse < Response
	@response = nil
	
	def initialize(cResponse)
		set(cResponse)
	end

	def set(cResponse)
		begin
			@statusCode = cResponse.code
			@response = JSON.parse(cResponse.read_body)
			@data = @response['data']
			@status = @response['status']
		rescue
		end
	end

end