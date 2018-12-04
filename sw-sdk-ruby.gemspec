Gem::Specification.new do |s|
  s.name = %q{sw-sdk-ruby}
  s.version = "0.0.2.1.pre"
  s.date = %q{2018-03-12}
  s.summary = "sw-sdk-ruby"
  s.licenses = ['MIT']
  s.description = "Librería para timbrado de CFDI a través de WebService"
  s.authors     = ["Juan Gamez"]
  s.email       = ['juan.gamez@sw.com.mx','dev@sw.com.mx']
  s.homepage    = 'https://sw.com.mx/'
  s.metadata    = { "source_code_uri" => "https://github.com/lunasoft/sw-sdk-ruby"}
  s.extra_rdoc_files = ['README.MD']
  s.files = Dir['lib/*.rb'] + Dir['bin/*']
  s.files += Dir['[A-Z]*'] + Dir['test/**/*']
  s.require_paths = ["lib"]
end