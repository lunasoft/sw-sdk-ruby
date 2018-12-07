require_relative '../../lib/Authentication/Auth.rb'
require_relative '../../lib/Issue/Issue.rb'
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
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        json_hash['Fecha'] = Time.now.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v1(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v2
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        json_hash['Fecha'] = Time.now.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v2(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v3
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        json_hash['Fecha'] = Time.now.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v3(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
    def test_issue_JSON_v4
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        json_hash = JSON.parse(json)
        json_hash['Fecha'] = Time.now.strftime('%FT%T')
        Issue::set(params)
        result_issue = Issue::issue_JSON_v4(json_hash.to_json)
        assert(result_issue.get_status == "success" || result_issue.get_message =~ /^307/, "Expected \"success\" but was #{result_issue.get_status}")
    end
end