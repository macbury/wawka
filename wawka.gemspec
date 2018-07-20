
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wawka/version"

Gem::Specification.new do |spec|
  spec.name          = "wawka"
  spec.version       = Wawka::VERSION
  spec.authors       = ["Arkadiusz Buras"]
  spec.email         = ["macbury@gmail.com"]

  spec.summary       = "Handful tool for generating bureaucracy shit xlses"
  spec.description   = "Handful tool for generating bureaucracy shit xlses"
  spec.homepage      = "http://macbury.ninja"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency 'spreadsheet', '~> 1.1'
  spec.add_dependency 'dry-transaction', '~> 0.13'
  spec.add_dependency 'httparty', '~> 0.16.2'
  spec.add_dependency 'simple-spreadsheet', '~> 0.5.0'
  spec.add_dependency 'thor', '~> 0.20.0'
  spec.add_dependency 'activesupport', '~> 5.2'
end
