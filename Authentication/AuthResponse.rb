require_relative '../Response.rb'
require 'net/http'
require 'json'

class AuthResponse < Response
	@response = nil
	@token = nil
	@timeExpire = nil
	def initialize(cResponse)
		set(cResponse)
	end

	def set(cResponse)
		begin
			@statusCode = cResponse.code
			@response = JSON.parse(cResponse.read_body)
			@data = @response['data']
			@status = @response['status']
			@token = @data['token']
			@timeExpire = @data['expires_in']
		rescue
		end
	end

	def getToken()
		return @token
	end
	def getTimeExpire()
		return @timeExpire
	end
end