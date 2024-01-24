require_relative '../../lib/Sign/sign.rb'
require_relative '../../lib/Stamp/stamp.rb'
require_relative '../Helpers/test_helper.rb'
require 'test/unit'
require 'json'

  class SignTest < Test::Unit::TestCase
    def test_sign_success
      xml = TestHelper::read_file('../Resources/cfdi/cfdi40.xml')
      pfx = TestHelper::create_pfx
      password = "12345678a"
      xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
      params = { "url" => 'http://services.test.sw.com.mx', "user" => 'david.reyes@sw.com.mx', "password" => 'Test2023..' }
      Stamp::set(params)
      response = Stamp::stamp_v1(xml_signed)
      assert(response.get_status == "success")
      assert(response.get_data != nil)
      assert(response.get_data.to_s.strip != "")
    end
  end

  class SignTest < Test::Unit::TestCase
    def test_sign_success_cceP
      xml = TestHelper::read_file('../Resources/cfdi/cce20Propietario.xml')
      pfx = TestHelper::create_pfx
      password = "12345678a"
      xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
      params = { "url" => 'http://services.test.sw.com.mx', "user" => 'david.reyes@sw.com.mx', "password" => 'Test2023..' }
      Stamp::set(params)
      response = Stamp::stamp_v1(xml_signed)
      assert(response.get_status == "success")
      assert(response.get_data != nil)
      assert(response.get_data.to_s.strip != "")
    end
  end
  
  class SignTest < Test::Unit::TestCase
    def test_sign_success_cce
      xml = TestHelper::read_file('../Resources/cfdi/cce20.xml')
      pfx = TestHelper::create_pfx
      password = "12345678a"
      xml_signed = TestHelper::get_signed_cfdi(xml, pfx, password)
      params = { "url" => 'http://services.test.sw.com.mx', "user" => 'david.reyes@sw.com.mx', "password" => 'Test2023..' }
      Stamp::set(params)
      response = Stamp::stamp_v1(xml_signed)
      assert(response.get_status == "success")
      assert(response.get_data != nil)
      assert(response.get_data.to_s.strip != "")
    end
  end
  