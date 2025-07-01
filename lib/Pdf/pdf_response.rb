require_relative '../Response.rb'
require 'net/http'
require 'json'

class PdfResponse < Response
	@response = nil
	@contentB64 = nil
  @contentSizeBytes = nil
  @uuid = nil
  @serie = nil
  @folio = nil
  @stampDate = nil
  @issuedDate = nil
  @rfcIssuer = nil
  @rfcReceptor = nil
  @total = nil

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
					@contentB64 = @data['contentB64']
					@contentSizeBytes = @data['contentSizeBytes']
					@uuid = @data['uuid']
					@serie = @data['serie']
					@folio = @data['folio']
					@stampDate = @data['stampDate']
					@issuedDate = @data['issuedDate']
					@rfcIssuer = @data['@rfcIssuer']
					@rfcReceptor = @data['rfcReceptor']
					@total = @data['total']
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

	def get_contentB64
		return @contentB64
	end
	def get_contentSizeBytes
		return @contentSizeBytes
	end
	def get_uuid
		return @uuid
	end
	def get_serie
		return @serie
	end
	def get_folio
		return @folio
	end
	def get_stampDate
		return @stampDate
	end
	def get_issuedDate
		return @issuedDate
	end
	def get_rfcIssuer
		return @rfcIssuer
	end
	def get_rfcReceptor
		return @rfcReceptor
	end
	def get_total
		return @total
	end

end
