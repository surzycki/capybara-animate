# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capybara-animate"
  spec.version       = File.read("VERSION")
  spec.authors       = ["Caleb Buxton"]
  spec.email         = ["me@cpb.ca"]
  spec.description   = %q{Composes Gif Animations from screenshots taken after capybara specified user actions.}
  spec.summary       = %q{Gif Animations of your Headless Browser tests.}
  spec.homepage      = "https://github.com/cpb/capybara-animate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara", ">= 2.10.1"
  spec.add_dependency "gifanime", "~> 0.1"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta2"
  spec.add_development_dependency "simplecov"
end
