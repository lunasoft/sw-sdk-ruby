require_relative '../Services.rb'
require_relative 'PendingsRequest.rb'

class Pendings < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.getPendings(cRFC)
		return SWpendings::pendings(Services::getUrl(), Services::getToken(), cRFC)
	end
end