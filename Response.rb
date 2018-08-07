require_relative 'Services.rb'
class Response
	@status = nil
	@message = nil
	@messageDetail = nil
	@data = nil
	@statusCode = nil

	def getStatus()
		return @status
	end
	def getMessage()
		return @message
	end
	def getMessageDetail()
		return @messageDetail
	end
	def getData()
		return @data
	end
	def getStatusCode()
		return @statusCode
	end

	def validateStatusCode(response)
		if(response.getStatus == 'success')
			return response
		else
			case response.getStatusCode.to_i
			when 300..399
				Services::raiseException("\nmessage: #{response.getMessage}\nmessageDetail: #{response.getMessageDetail}\nstatus: #{response.getStatus}\nstatusCode: #{response.getStatusCode} Redireccion")
			when 400..499
				if response.getMessage =~ /^307/
					return response
				end
				Services::raiseException("\nmessage: #{response.getMessage}\nmessageDetail: #{response.getMessageDetail}\nstatus: #{response.getStatus}\nstatusCode: #{response.getStatusCode} Error del cliente")
			when 500..599
				Services::raiseException("\nmessage: #{response.getMessage}\nmessageDetail: #{response.getMessageDetail}\nstatus: #{response.getStatus}\nstatusCode: #{response.getStatusCode} Error del servidor")
			end
		end

	end
end