require_relative '../../lib/Authentication/Auth.rb'
require_relative '../../lib/Issue/Issue.rb'
require 'test/unit'

def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read()
    file.close
    return data
  end

class IssueTest < Test::Unit::TestCase 
    def test_IssueJSONV1
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        Issue::set(params)
        resultIssue = Issue::issueJsonV1(json)
        assert(resultIssue.getStatus() == "success" || resultIssue.getMessage() =~ /^307/, "Expected \"success\" but was #{resultIssue.getStatus()}")
    end
    def test_IssueJSONV2
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        Issue::set(params)
        resultIssue = Issue::issueJsonV2(json)
        assert(resultIssue.getStatus() == "success" || resultIssue.getMessage() =~ /^307/, "Expected \"success\" but was #{resultIssue.getStatus()}")
    end
    def test_IssueJSONV3
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        Issue::set(params)
        resultIssue = Issue::issueJsonV3(json)
        assert(resultIssue.getStatus() == "success" || resultIssue.getMessage() =~ /^307/, "Expected \"success\" but was #{resultIssue.getStatus()}")
    end
    def test_IssueJSONV4
        params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
        json = read_file("resources/cfdi.json")
        Issue::set(params)
        resultIssue = Issue::issueJsonV4(json)
        assert(resultIssue.getStatus() == "success" || resultIssue.getMessage() =~ /^307/, "Expected \"success\" but was #{resultIssue.getStatus()}")
    end
end