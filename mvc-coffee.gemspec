require File.expand_path('../lib/mvc-coffee/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "mvc-coffee"
  s.version     = MvcCoffee::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Erik Rothoff Andersson"]
  s.email       = ["erik.rothoff@gmail.com"]
  s.homepage    = "http://github.com/erkie/mvc.coffee"
  s.summary     = "Use mvc.coffee with Rails"
  s.description = "This gem provides mvc.coffee for Rails applications."
  s.license     = "MIT"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "railties", ">= 4.2.0"
  s.add_dependency "thor",     ">= 0.14", "< 2.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
end
