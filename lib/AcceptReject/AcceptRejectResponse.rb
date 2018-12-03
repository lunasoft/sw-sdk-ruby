require_relative '../Response.rb'
require 'net/http'
require 'json'

class AcceptRejectResponse < Response
	def initialize(cResponse)
		set(cResponse)
    end
    def getAcuse()
       return @acuse 
    end
	def set(cResponse)
		@statusCode = cResponse.code
		begin
			@response = JSON.parse(cResponse.read_body)
			@status = @response['status']
			@data = @response['data']
        rescue
            @message = @response['message']
			@messageDetail = @response['messageDetail']
		end
	end
end