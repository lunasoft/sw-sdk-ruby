require 'rubygems'
require 'time'

class Services
	@token = "" 
	@url = ""
	@user = ""
	@password = ""
	@expirationDate = Time.at(0)

	private
	def self.raiseException(text)
		raise text
	end

	private
	def self.setData(params)
		if (params.has_key?('url') and not params['url'].nil?)
			@url = params['url']
		else 
			Services::raiseException("URL debe especificarse")
		end

		if (params.has_key?('user') and not params['user'].nil?) and (params.has_key?('password') and not params['password'].nil?)
			@user = params['user']
			@password = params['password']
		else if (params.has_key?('token') and not params['token'].nil?)
				@token = params['token']
				@expirationDate = Time.at(999999999)
			else
				Services::raiseException("Datos de autenticación deben especificarse")
			end
		end

	end

	def self.getToken()
		if (@token.nil? or @token.empty?) or (Time.now > @expirationDate)
			response = Auth::authentication()
			@token = response.getToken
			@expirationDate = Time.at(response.getTimeExpire)
		end
		return @token
	end

	def self.getUrl()
		return @url
	end

	def self.getUser()
		return @user
	end

	def self.getPassword()
		return @password
	end

	def self.setToken(token)
		@token = token
	end

end
