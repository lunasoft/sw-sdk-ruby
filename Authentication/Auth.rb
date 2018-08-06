require_relative '../Services.rb'
require_relative 'AuthRequest.rb'

class Auth < Services

   def self.set(params)
      Services::setData(params)
   end


	def self.authentication()
      return SWauthentication::authentication(Services::getUrl(),Services::getUser(),Services::getPassword())
  	end 

end# Auth