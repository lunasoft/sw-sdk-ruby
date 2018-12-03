require_relative '../Response.rb'
require 'net/http'
require 'json'

class IssueResponse < Response
	@uuid = nil
	@qrCode = nil
	@cfdi = nil
	def initialize(cResponse)
		set(cResponse)
	end
	def set(cResponse)
		begin
			@statusCode = cResponse.code
			@response = JSON.parse(cResponse.read_body)
			@data = @response['data']
			@status = @response['status']
			@message = @response['message']
			@messageDetail = @response['messageDetail']		
			@uuid = @response['data']['uuid']
			@qrCode = @response['data']['qrCode']
			@cfdi = @response['data']['cfdi']
		rescue
		end
	end

	def getUuid()
		return @uuid
	end
	def getQrCode()
		return @qrCode
	end
	def getCfdi()
		return @cfdi
	end
end