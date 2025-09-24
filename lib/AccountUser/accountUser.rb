require_relative '../Services.rb'
require_relative '../AccountUser/accountUser_request.rb'
require_relative 'accountUser_request.rb'

class AccountUser < Services
   def self.set(params)
		Services::set_data(params)
	end

   def self.create_user(name, taxId, email, stamps, isUnlimited, password, notificationEmail, phone)
      return SwAccountUser::create_user(Services::get_url_api, Services::get_token, name, taxId, email, stamps, isUnlimited, password, notificationEmail, phone)
   end

   def self.delete_user(idUser)
      return SwAccountUser::delete_user(Services::get_url_api, Services::get_token, idUser)
   end

   def self.update_user(idUser, name, taxId, notificationEmial, phone, isUnlimited=false)
      return SwAccountUser::update_user(Services::get_url_api, Services::get_token, idUser, name, taxId, notificationEmial, phone, isUnlimited)
   end

   def self.get_users(**params)
      return SwAccountUser.get_users(Services::get_url_api, Services::get_token, **params)
   end

end
