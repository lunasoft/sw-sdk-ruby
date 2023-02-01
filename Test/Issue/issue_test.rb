require_relative '../../lib/Issue/issue.rb'
require 'test/unit'
require 'json'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
  end

class IssueTest < Test::Unit::TestCase 
    def test_issue_JSON_v1
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        fecha = Time.at(Time.now.to_i - 86400)
        json_hash['Fecha'] = fecha.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v1(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v2
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        fecha = Time.at(Time.now.to_i - 86400)
        json_hash['Fecha'] = fecha.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v2(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v3
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        fecha = Time.at(Time.now.to_i - 86400)
        json_hash['Fecha'] = fecha.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v3(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v4
        params = {"url" => 'http://services.test.sw.com.mx', "user" => ENV["SDKTEST_USER"], "password" => ENV["SDKTEST_PASSWORD"]}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        fecha = Time.at(Time.now.to_i - 86400)
        json_hash['Fecha'] = fecha.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v4(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
end
