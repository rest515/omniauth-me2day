# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-me2day/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-me2day"
  s.version     = Omniauth::Me2day::VERSION
  s.authors     = ["MunShik JEONG, Ohyeon KWEON"]
  s.email       = ["ruseel@gmail.com, rest515@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Omniauth strategy for me2day }
  s.description = %q{Omniauth strategy for me2day }

  s.rubyforge_project = "omniauth-me2day"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "omniauth"
  s.add_runtime_dependency "multi_json"
end
