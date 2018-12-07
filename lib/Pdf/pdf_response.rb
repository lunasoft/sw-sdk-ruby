require_relative '../Response.rb'
require 'net/http'
require 'json'

class PendingsResponse < Response
	def initialize(response)
		set(response)
	end

	def set(response)
		begin
			@status_code = response.code
			@response = JSON.parse(response.read_body)
			@data = @response['data']
			@status = @response['status']
    rescue
      @message = @response['message']
			@messageDetail = @response['messageDetail']
		end
	end

end