require_relative '../Response.rb'
require 'net/http'
require 'json'

class GenericResponse < Response
	def initialize(response)
		set(response)
	end
	def set(response)
		begin
			@status_code = response.code
			if response.body
				@response = JSON.parse(response.body)
				if @status_code.to_i == 200
          @status = @response['status']
          @data = @response['data']
				else
					@status = 'error'
					@message = @response['message']
					@messageDetail = @response['messageDetail']
				end
			else
				response.value
			end
		rescue
		end
	end
end