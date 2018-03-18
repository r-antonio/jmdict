
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jmdict/version"

Gem::Specification.new do |spec|
  spec.name          = "jmdict"
  spec.version       = JMDict::VERSION
  spec.authors       = ["Ramiro Antonio"]
  spec.email         = ["ramiro.antonio@outlook.com"]

  spec.summary       = %q{A wrapper for JMDict (http://www.edrdg.org/jmdict/edict_doc.html)}
  spec.description   = %q{This gem parses the JMDict XML file to get a more friendly hash interface for its entries}
  spec.homepage      = "https://github.com/r-antonio/jmdict"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri", "~> 1.7"
end
