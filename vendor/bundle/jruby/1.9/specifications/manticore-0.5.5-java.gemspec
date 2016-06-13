# -*- encoding: utf-8 -*-
# stub: manticore 0.5.5 java lib

Gem::Specification.new do |s|
  s.name = "manticore"
  s.version = "0.5.5"
  s.platform = "java"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Heald"]
  s.date = "2016-03-15"
  s.description = "Manticore is an HTTP client built on the Apache HttpCore components"
  s.email = ["cheald@mashable.com"]
  s.homepage = "https://github.com/cheald/manticore"
  s.licenses = ["MIT"]
  s.requirements = ["jar org.apache.httpcomponents:httpclient, 4.5", "jar org.apache.httpcomponents:httpmime, 4.5"]
  s.rubygems_version = "2.4.8"
  s.summary = "Manticore is an HTTP client built on the Apache HttpCore components"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<ruby-maven>, ["~> 3.3"])
      s.add_runtime_dependency(%q<jar-dependencies>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<ruby-maven>, ["~> 3.3"])
      s.add_dependency(%q<jar-dependencies>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<ruby-maven>, ["~> 3.3"])
    s.add_dependency(%q<jar-dependencies>, [">= 0"])
  end
end
