require_relative '../../lib/AccountUser/accountUser.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'

class AccountUserTest < Test::Unit::TestCase
  def test_AccountUser_create_user_auth
    params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
    AccountUser::set(params)
    name = "Prueba UT Hijo Ruby"
    taxId = "XAXX010101000"
    email = "userRuby_#{ENV['SDKTEST_USER']}"
    password = "_#{ENV['SDKTEST_PASSWORD']}"
    notificationEmail = "user_#{ENV['SDKTEST_USER']}"
    phone = "0000000000"
    response = AccountUser::create_user(name,taxId,email,1,false,password,notificationEmail,phone)
    message_expect = "El email '#{email}' ya esta en uso."
    assert(response.get_status == "success" || response.get_message == message_expect)
  end

  def test_AccountUser_create_user
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    name = "Prueba UT Hijo Ruby"
    taxId = "XAXX010101000"
    email = "userRuby_#{ENV['SDKTEST_USER']}"
    password = "_#{ENV['SDKTEST_PASSWORD']}"
    notificationEmail = "user_#{ENV['SDKTEST_USER']}"
    phone = "0000000000"
    response = AccountUser::create_user(name,taxId,email,1,false,password,notificationEmail,phone)
    message_expect = "El email '#{email}' ya esta en uso."
    assert(response.get_status == "success" || response.get_message == message_expect)
  end

  #UT de Consulta Usuarios
  def test_AccountUser_All_auth
    params = {"url_api" => 'http://api.test.sw.com.mx', "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
    AccountUser::set(params)
    response = AccountUser::get_users
    assert(response.get_status == "success")
    assert(response.get_data != "")
  end

  def test_AccountUser_by_id
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    response = AccountUser::get_users(IdUser: "32501CF2-DC62-4370-B47D-25024C44E131")
    assert(response.get_status == "success")
    assert(response.get_data != "")
    data = response.get_data
    puts "Consulta por ID"
    data.items.each do |user|
      puts "ID: #{user.idUser}, Nombre: #{user.name}, RFC: #{user.taxId}, Email: #{user.email}, Stamps: #{user.stamps}, token: #{user.accessToken}"
    end
  end

  def test_AccountUser_by_email
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    response = AccountUser::get_users(Email: "userRuby_#{ENV['SDKTEST_USER']}")
    assert(response.get_status == "success")
    assert(response.get_data != "")
    data = response.get_data
  end

  def test_AccountUser_by_taxId
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    taxId = "AAAA000101010"
    response = AccountUser::get_users(TaxId:"AAAA000101010" )
    assert(response.get_status == "success")
    assert(response.get_data != "")
  end

  def test_AccountUser_by_isActive
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    response = AccountUser::get_users(IsActive: true)
    assert(response.get_status == "success")
    assert(response.get_data != "")
  end

  def test_AccountUser_delete_user
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    idUser = '2990D2BB-B26A-4FD5-B1CC-07AE84AE8085'
    message_expect = 'El usuario ya ha sido previamente removido'
    response = AccountUser::delete_user(idUser)
    assert(response.get_status == "error")
    assert(response.get_message == message_expect )
  end

  def test_AccountUser_update_user
    params = {"url_api" => 'http://api.test.sw.com.mx',  "token" => ENV["SDKTEST_TOKEN"]}
    AccountUser::set(params)
    idUser = "b9e42c65-4afa-45a2-9b0d-d67b1373a7f4"
    name = "Prueba UT Hijo Python Actualizado"
    taxId = "XAXX010101002"
    phone = "0000000001"
    message_expect = "No es posible actualizar, los datos enviados son identicos a los actuales"
    response = AccountUser::update_user(idUser,name,taxId,nil,phone,false)
    assert(response.get_message == message_expect )
  end
end
