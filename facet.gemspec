# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "facet"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kenji Hara"]
  s.date = "2012-12-31"
  s.description = "Helper for creating RubyGem project"
  s.email = "haracane@gmail.com"
  s.executables = ["facet"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/facet",
    "lib/facet.rb",
    "lib/facet/command/build.rb",
    "lib/facet/templates/.document.erb",
    "lib/facet/templates/.gitignore.erb",
    "lib/facet/templates/.rspec.erb",
    "lib/facet/templates/Gemfile.erb",
    "lib/facet/templates/LICENSE.txt.erb",
    "lib/facet/templates/README.rdoc.erb",
    "lib/facet/templates/Rakefile.erb",
    "lib/facet/templates/lib/project.rb.erb",
    "lib/facet/templates/spec/lib/project_spec.rb.erb",
    "lib/facet/templates/spec/spec_helper.rb.erb",
    "spec/bin/facet_spec.rb",
    "spec/lib/facet_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/haracane/facet"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Helper for creating RubyGem project"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>, [">= 1.7.0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<ci_reporter>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<ci_reporter>, [">= 1.7.0"])
  end
end

