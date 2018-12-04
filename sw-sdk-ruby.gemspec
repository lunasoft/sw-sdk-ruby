Gem::Specification.new do |s|
  s.name = %q{sw-sdk-ruby}
  s.version = "0.0.2.1.pre"
  s.date = %q{2018-03-12}
  s.summary = "sw-sdk-ruby"
  s.licenses = ['MIT']
  s.description = "Librería para timbrado de CFDI a través de WebService"
  s.authors     = ["Juan Gamez"]
  s.email       = 'juan.gamez@sw.com.mx'
  s.homepage    = 'https://sw.com.mx/'
  s.metadata    = { "source_code_uri" => "https://github.com/lunasoft/sw-sdk-ruby"}
  s.files = [
    "lib/AcceptReject/AcceptReject.rb",
	"lib/AcceptReject/AcceptRejectRequest.rb",
	"lib/AcceptReject/AcceptRejectResponse.rb",
	"lib/Authentication/Auth.rb",
	"lib/Authentication/AuthRequest.rb",
	"lib/Authentication/AuthResponse.rb",
	"lib/Balance/Balance.rb",
	"lib/Balance/BalanceRequest.rb",
	"lib/Balance/BalanceResponse.rb",
	"lib/Cancelation/Cancelation.rb",
	"lib/Cancelation/CancelationRequest.rb",
	"lib/Cancelation/CancelationResponse.rb",
	"lib/Issue/Issue.rb",
	"lib/Issue/IssueRequest.rb",
	"lib/Issue/IssueResponse.rb",
	"lib/Pdf/Pdf.rb",
	"lib/Pdf/PdfRequest.rb",
	"lib/Pdf/PdfResponse.rb",
	"lib/Pendings/Pendings.rb",
	"lib/Pendings/PendingsRequest.rb",
	"lib/Pendings/PendingsResponse.rb",
	"lib/Stamp/Stamp.rb",
	"lib/Stamp/StampRequest.rb",
	"lib/Stamp/StampResponse.rb",
	"lib/StatusCfdi/StatusCfdi.rb",
	"lib/Relations/Relations.rb",
	"lib/Relations/RelationsRequest.rb",
	"lib/Relations/RelationsResponse.rb",
	"lib/StatusCfdi/StatusCfdiRequest.rb",
	"lib/StatusCfdi/StatusCfdiResponse.rb",
	"lib/Validation/Validate.rb",
	"lib/Validation/ValidateRequest.rb",
	"lib/Validation/ValidateResponse.rb",
	"lib/Services.rb",
	"lib/Response.rb",
  ]
  s.require_paths = ["lib"]
end