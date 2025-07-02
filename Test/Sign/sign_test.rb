require_relative '../../lib/Sign/sign.rb'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'
require 'json'

class SignTest < Test::Unit::TestCase
  def test_sign_success
    xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40.xml"))
    pfx = TestHelper::create_pfx
    password = "12345678a"
    xml_signed, cadena_original = TestHelper::get_signed_cfdi(xml, pfx, password)
    params = { "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"] }
    Stamp::set(params)
    response = Stamp::stamp_v1(xml_signed)
    puts response.get_message
    puts response.get_messageDetail
    assert(response.get_status == "success")
    assert(response.get_data != nil)
    assert(response.get_data.to_s.strip != "")
  end
end

class SignTest < Test::Unit::TestCase
  def test_sign_success_cp31
    xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/cfdi40_cp31.xml"))
    pfx = TestHelper::create_pfx
    password = "12345678a"
    xml_signed, cadena_original = TestHelper::get_signed_cfdi(xml, pfx, password)
    params = { "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"] }
    Stamp::set(params)
    response = Stamp::stamp_v1(xml_signed)
    puts response.get_message
    puts response.get_messageDetail
    assert(response.get_status == "success")
    assert(response.get_data != nil)
    assert(response.get_data.to_s.strip != "")
  end
end

class SignTest < Test::Unit::TestCase
  def test_sign_success_nom
    xml = TestHelper::read_file(File.join(__dir__, "../Resources/cfdi/nomina12.xml"))
    pfx = TestHelper::create_pfx
    password = "12345678a"
    xml_signed, cadena_original = TestHelper::get_signed_cfdi(xml, pfx, password)
    params = { "url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"] }
    Stamp::set(params)
    response = Stamp::stamp_v1(xml_signed)
    puts response.get_message
    puts response.get_messageDetail
    assert(response.get_status == "success")
    assert(response.get_data != nil)
    assert(response.get_data.to_s.strip != "")
  end
end
