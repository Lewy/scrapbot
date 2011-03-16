# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scrapbot/version"

Gem::Specification.new do |s|
  s.name        = "scrapbot"
  s.version     = Scrapbot::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pawel Lewinski"]
  s.email       = ["lewy313@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Scrapping Bot}
  s.description = %q{Bot for archive pages}

  s.add_development_dependency "grit"
  s.add_development_dependency "typhoeus"

  s.executables = ["scrapbot"]

  s.rubyforge_project = "scrapbot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
