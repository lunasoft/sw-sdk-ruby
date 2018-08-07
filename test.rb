require_relative 'Authentication/Auth.rb'
require_relative 'Stamp/Stamp.rb'
require_relative 'Cancelation/Cancelation.rb'
require_relative 'Validation/Validate.rb'
require_relative 'Balance/Balance.rb'
require_relative 'Issue/Issue.rb'


def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read()
  file.close
  return data
end

b64CSD = read_file('resources\b64CSD.txt')
b64Key = read_file('resources\b64Key.txt')
b64PFX = read_file('resources\b64Pfx.txt')
xmlCancel = read_file('resources\cancelByXml.xml')
xml = read_file('resources\xml33.xml')
passwordcsd = '12345678a'
noCert = '20001000000300022815'
uuid = 'f784a223-a73d-429c-aa10-3f64a3d86dee'
rfc = 'LAN7008173R5'




params = {"url" => 'http://services.test.sw.com.mx', "user" => 'demo', "password" => '123456789'}
resultSpect = "success"


Auth::set(params)
resultAuth = Auth::authentication()
if resultSpect != resultAuth.getStatus()
	Services::raiseException("Auth Fail")
else
	puts "Auth -> ok"
end


Stamp::set(params)
resultStamp = Stamp::stampV4(xml)
if (resultSpect == resultStamp.getStatus()) || (resultStamp.getMessage() =~ /^307/)
	puts "Stamp -> ok"
else
	Services::raiseException("Stamp Fail")
end


Issue::set(params)
resultIssue = Issue::issueV4(xml)
if (resultSpect == resultIssue.getStatus()) || (resultIssue.getMessage() =~ /^307/)
	puts "Issue -> ok"
else
	Services::raiseException("Issue Fail")
end


Cancelation::set(params)
resultCancelCSD = Cancelation::cancelCsd(uuid, rfc, passwordcsd, b64CSD, b64Key)
if resultSpect != resultCancelCSD.getStatus()
	Services::raiseException("CancelCSD Fail")
else
	puts "CancelCSD -> ok"
end
resultCancelUUID = Cancelation::cancelUuid(uñuid, rfc)
if resultSpect != resultCancelUUID.getStatus()
	Services::raiseException("CancelUUID Fail")
else
	puts "CancelUUID -> ok"
end
resultCancelPFX = Cancelation::cancelPfx(uuid, rfc, passwordcsd, b64PFX)
if resultSpect != resultCancelPFX.getStatus()
	Services::raiseException("CancelPFX Fail")
else
	puts "CancelPFX -> ok"
end
resultCancelXML = Cancelation::cancelXml(xmlCancel)
if resultSpect != resultCancelXML.getStatus()
	Services::raiseException("CancelXML Fail")
else
	puts "CancelXML -> ok"
end


Balance::set(params)
resultBalance = Balance::getAccountBalance()
if resultSpect != resultBalance.getStatus()
	Services::raiseException("Balance Fail")
else
	puts "Balance -> ok"
end


Validate::set(params)
resultValidateXML = Validate::validateXml(xml)
if resultSpect != resultValidateXML.getStatus()
	Services::raiseException("ValidateXml Fail")
else
	puts "ValidateXml -> ok"
end
resultValidateLrfc = Validate::validateLrfc(rfc)
if resultSpect != resultValidateLrfc.getStatus()
	Services::raiseException("ValidateLrfc Fail")
else
	puts "ValidateLrfc -> ok"
end
resultValidateNoCert = Validate::validateNoCert(noCert)
if resultSpect != resultValidateNoCert.getStatus()
	Services::raiseException("ValidateNoCert Fail")
else
	puts "ValidateNoCert -> ok"
end

