Gem::Specification.new do |s|
  s.name = %q{sw-sdk-ruby}
  s.version = "0.0.3.1.pre"
  s.date = %q{2023-01-31}
  s.summary = "sw-sdk-ruby"
  s.licenses = ['GPL-3.0']
  s.description = "Librería para timbrado de CFDI a través de WebService."
  s.authors     = ["Juan Gamez"]
  s.email       = ['juan.gamez@sw.com.mx','dev@sw.com.mx']
  s.homepage    = 'https://sw.com.mx/'
  s.metadata    = { "source_code_uri" => "https://github.com/lunasoft/sw-sdk-ruby"}
  s.required_ruby_version = '>= 2.1'
  s.files = Dir['lib/**/*'] + Dir['bin/*']
  s.files += Dir['[A-Z]*'] + Dir['test/**/*']
  s.require_paths = ["lib"]
end