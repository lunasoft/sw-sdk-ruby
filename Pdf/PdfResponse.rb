require_relative '../Response.rb'
require 'net/http'
require 'json'

class PendingsResponse < Response
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
            @message = @response['message']
			@messageDetail = @response['messageDetail']
		end
	end

end