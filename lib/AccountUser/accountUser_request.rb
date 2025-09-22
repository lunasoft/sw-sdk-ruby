require_relative 'accountUser_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwAccountUser
  @@pathBase = "/management/v2/api/dealers/users"

  def self.get_path(filter, idUser = nil, email = nil, taxId = nil, isActive = nil)
    endpoint = @@pathBase
    case filter
    when "All"
      path = endpoint
    when "IdUser"
      path = "#{endpoint}/?IdUser=#{idUser}"
    when "Email"
      path = "#{endpoint}/?Email=#{email}"
    when "TaxId"
      path = "#{endpoint}/?TaxId=#{taxId}"
    when "IsActive"
      path = "#{endpoint}/?IsActive=#{isActive}"
    else
      path = endpoint
    end
    return path
  end

  def self.get_users(urlApi, token, filter, idUser = nil, email = nil, taxId = nil, isActive = nil)
    path = get_path(filter, idUser, email, taxId, isActive)
    endpoint = URI(urlApi + path)
    response = RequestHelper.get_json_request(endpoint, token)
    return AccountUserResponse.new(response)
  end

  def self.create_user(urlApi, token, name, taxId, email, stamps, isUnlimited, password, notificationEmail, phone)
    endpoint = URI(urlApi + "/management/v2/api/dealers/users")
    payload = {
      "name" => name,
      "taxId" => taxId,
      "email" => email,
      "stamps" => stamps,
      "isUnlimited" => isUnlimited,
      "password" => password,
      "notificationEmail" => notificationEmail,
      "phone" => phone
    }
    response = RequestHelper.post_json_request(endpoint, token, payload)
    response_obj = AccountUserResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.delete_user(urlApi, token, idUser)
    endpoint = URI(urlApi+ "#{@@pathBase}/#{idUser}")
    response = RequestHelper.delete_json_request(endpoint, token, nil)
    return AccountUserResponse.new(response)
  end

  def self.update_user(urlApi, token, idUser, name, taxId, notificationEmail, phone, isUnlimited)
    endpoint = URI(urlApi+ "#{@@pathBase}/#{idUser}")
    payload = {
      "idUser" => idUser,
      "name" => name,
      "taxId" => taxId,
      "notificationEmail" => notificationEmail,
      "phone" => phone,
      "isUnlimited" => isUnlimited
    }
    response = RequestHelper.put_json_request(endpoint, token, payload)
    return AccountUserResponse.new(response)
  end

end
