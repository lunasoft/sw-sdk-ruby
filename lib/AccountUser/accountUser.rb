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

   def self.getUser_all()
      return SwAccountUser::get_users(Services::get_url_api, Services::get_token, "All")
   end

   def self.getUser_by_IdUser(idUser)
      return SwAccountUser::get_users(Services::get_url_api, Services::get_token, "IdUser", idUser)
   end

   def self.getUser_by_email(email)
      return SwAccountUser::get_users(Services::get_url_api, Services::get_token,"Email",nil,email)
   end

   def self.getUser_by_taxId(taxId)
      return SwAccountUser::get_users(Services::get_url_api, Services::get_token,"TaxId",nil,nil,taxId)
   end

   def self.getUser_by_isActive(isActive)
      return SwAccountUser::get_users(Services::get_url_api, Services::get_token,"IsActive",nil,nil,nil,isActive)
   end

end
