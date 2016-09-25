Gem::Specification.new do |spec|
  spec.name          = "rpdfs"
  spec.version       = (require_relative "lib/rpdfs"; RPDFS::VERSION)
  spec.author        = "Victor Maslov"
  spec.email         = "nakilon@gmail.com"
  spec.summary       = "Ruby-powered DSL for generating PDF slide presentations"
  spec.description   = "No need in Power Point, Adobe Acrobat or Open Office to edit your presentations anymore."
  spec.homepage      = "https://github.com/Nakilon/rpdfs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = "spec/"

  spec.add_dependency "wkhtmltopdf-binary", "= 0.12.3"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "pdf-reader"

  spec.required_ruby_version = ">= 2.0.0"
end
