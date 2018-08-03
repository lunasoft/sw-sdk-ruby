require 'rubygems'
require_relative 'Authentication/Auth.rb'

class Services
	@token = "" #variables de clase
	@url = ""
	@user = ""
	@password = ""
	@expirationDate = ""

	private
	def self.setData(params)
		if (params.has_key?('url') and not params['url'].nil?)
			@url = params['url']
		else 
			puts "URL debe especificarse"
		end

		if (params.has_key?('token') and not params['token'].nil?)
			@token = params['token']
			#agregar expiration date
		else if ((not params.has_key?('user') or params['user'].nil?) or (not params.has_key?('password') or params['password'].nil?)) # or (not params.has_key?('token') or params['token'].nil?)
			puts "Datos de autenticación deben especificarse"
			end
		end

		if (params.has_key?('user') and not params['user'].nil?)
			@user = params['user']
		end

		if (params.has_key?('password') and not params['password'].nil?)
			@password = params['password']
		end

	end

	def self.getToken()
		if @token.nil? or @token.empty?# or dateTime Now > expirationDate
			@token = Auth::authentication()
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

end#services
