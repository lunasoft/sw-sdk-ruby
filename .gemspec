Gem::Specification.new do |s|
    s.name = %q{sw-sdk-ruby}
    s.version = "1.0.1"
    s.date = %q{2022-03-07}
    s.summary = "sw-sdk-ruby"
    s.licenses = ['GPL-3.0']
    s.description = "Librería para timbrado de CFDI a través de WebService, versión 1.0.1 se añade nueva forma de cancelación con motivo y uuid relacionado"
    s.authors     = ["Juan Gamez"]
    s.email       = ['juan.gamez@sw.com.mx','dev@sw.com.mx']
    s.homepage    = 'https://sw.com.mx/'
    s.metadata    = { "source_code_uri" => "https://github.com/lunasoft/sw-sdk-ruby"}
    s.required_ruby_version = '>= 2.1'
    s.files = Dir['lib/**/*'] + Dir['bin/*']
    s.files += Dir['[A-Z]*'] + Dir['test/**/*']
    s.require_paths = ["lib"]
  end