require_relative '../../lib/Stamp/stamp.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
end

class StampTest < Test::Unit::TestCase 
    def test_stamp_v1
        xml = read_file('resources/xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        response = Stamp::stamp_v1(xml)
        assert(response.get_message =~ /^307/, "Expected \"error 307\" but was #{response.get_message}")
    end

    def test_stamp_v2
        xml = read_file('resources/xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        response = Stamp::stamp_v2(xml)
        assert(response.get_message =~ /^307/, "Expected \"error 307\" but was #{response.get_message}")
    end

    def test_stamp_v3
        xml = read_file('resources/xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        response = Stamp::stamp_v3(xml)
        assert(response.get_message =~ /^307/, "Expected \"error 307\" but was #{response.get_message}")
    end

    def test_stamp_v4
        xml = read_file('resources/xml33.xml')
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        Stamp::set(params)
        response = Stamp::stamp_v4(xml)
        assert(response.get_message =~ /^307/, "Expected \"error 307\" but was #{response.get_message}")
    end
end
