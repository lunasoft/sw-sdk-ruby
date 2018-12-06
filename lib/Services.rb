require 'time'

class Services
	@token = "" 
	@url = ""
	@user = ""
	@password = ""
	@expiration_date = Time.at(0)

	def self.get_url
		return @url
	end

	def self.get_user
		return @user
	end

	def self.get_password
		return @password
	end

	def self.set_token(token)
		@token = token
	end

	def self.get_token
		if (@token.nil? or @token.empty?) or (Time.now > @expiration_date)
			response_obj = Auth::authentication
			@token = response_obj.get_token
			@expiration_date = Time.at(response_obj.get_time_expire)
		end
		return @token
	end

	private
	def self.raise_exception(text)
		raise text
	end

	private
	def self.set_data(params)
		if (params.has_key?('url') and params['url'])
			@url = params['url']
		else 
			Services::raise_exception("URL debe especificarse")
		end

		if (params.has_key?('user') and params['user']) and (params.has_key?('password') and params['password'])
			@user = params['user']
			@password = params['password']
		else if (params.has_key?('token') and params['token'])
				@token = params['token']
				@expiration_date = Time.at(999_999_999)
			else
				Services::raise_exception("Datos de autenticación deben especificarse")
			end
		end
	end

end
