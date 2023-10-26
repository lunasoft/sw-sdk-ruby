require_relative '../Services.rb'
require_relative 'auth_request.rb'

class Auth < Services
   def self.set(params)
      Services::set_data(params)
   end

	def self.authentication
      return SwAuthentication::authentication(Services::get_url, Services::get_user, Services::get_password)
  	end 
end
