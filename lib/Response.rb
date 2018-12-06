require_relative 'Services.rb'
class Response
	@status = nil
	@message = nil
	@messageDetail = nil
	@data = nil
	@status_code = nil
	@response = nil

	def get_status
		return @status
	end
	def get_message
		return @message
	end
	def get_messageDetail
		return @messageDetail
	end
	def get_data
		return @data
	end
	def get_status_code
		return @status_code
	end
	def get_response
		return @response
	end

	def validate_status_code(response)
		if(response.get_status == 'success')
			return response
		else
			case response.get_status_code.to_i
			when 300..399
				Services::raise_exception("\nmessage: #{response.get_message}\nmessageDetail: #{response.get_messageDetail}\nstatus: #{response.get_status}\nstatusCode: #{response.get_status_code} Redireccion")
			when 400..499
				if response.get_message =~ /^307/
					return response
				end
				Services::raise_exception("\nmessage: #{response.get_message}\nmessageDetail: #{response.get_messageDetail}\nstatus: #{response.get_status}\nstatusCode: #{response.get_status_code} Error del cliente")
			when 500..599
				Services::raise_exception("\nmessage: #{response.get_message}\nmessageDetail: #{response.get_messageDetail}\nstatus: #{response.get_status}\nstatusCode: #{response.get_status_code} Error del servidor")
			end
		end
	end
end