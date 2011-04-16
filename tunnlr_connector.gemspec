# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tunnlr_connector}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Mangino"]
  s.date = %q{2010-04-06}
  s.description = %q{A simple plugin to make your local developnment environment available to the internet using the tunnlr.com service}
  s.email = ["mmangino@elevatedrails.com"]
  s.files = Dir['lib/**/*.rb'] + ["init.rb","README","MIT-LICENSE"] + Dir["rails/**"] + Dir["bin/**"]
  s.homepage = %q{http://tunnlr.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tunnlr_connector}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Provide access to the tunnlr.com service}
  s.executables = ['tunnlr']
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>, [">= 2.0.15"])
      s.add_runtime_dependency(%q<highline>, [">= 1.5.0"])
    else
      s.add_dependency(%q<net-ssh>, [">= 2.0.15"])
      s.add_dependency(%q<highline>, [">= 1.5.0"])
    end
  else
    s.add_dependency(%q<net-ssh>, [">= 2.0.15"])
    s.add_dependency(%q<highline>, [">= 1.5.0"])
  end
end
