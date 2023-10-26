require_relative '../Response.rb'
require 'net/http'
require 'json'

class AuthResponse < Response
	@response = nil
	@token = nil
	@time_expire = nil
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
					@token = @data['token']
					@time_expire = @data['expires_in']
				else
					@status = 'error'
					@message = @response['message']
					@messageDetail = @response['messageDetail']
				end
			else
				response.value
			end
		rescue => exception
			@status = 'error'
			@message = exception.backtrace
		end
	end

	def get_token
		return @token
	end

	def get_time_expire
		return @time_expire
	end
end