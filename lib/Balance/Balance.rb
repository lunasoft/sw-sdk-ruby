require_relative '../Services.rb'
require_relative 'BalanceRequest.rb'

class Balance < Services
	def self.set(params)
		Services::setData(params)
	end

	def self.getAccountBalance()
		return SWaccountBalance::accountBalance(Services::getUrl(), Services::getToken())
	end
end