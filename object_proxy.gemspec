Gem::Specification.new do |s|
  s.name = %q{object_proxy}
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2009-10-11}
  s.description = %q{ObjectProxy provides a proxied interface to Ruby objects.  It lets you add methods to objects that don't normally support them.}
  s.email = ["rubygems@6brand.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "init.rb", "install.rb", "lib/object_proxy.rb", "lib/object_proxy_safe_hash.rb", "rails/init.rb", "test/test_object_proxy.rb", "test/test_object_proxy_safe_hash.rb"]
  s.homepage = %q{http://github.com/JackDanger/object_proxy/tree/master}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{objectproxy}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{ObjectProxy provides a proxied interface to Ruby objects}
  s.test_files = ["test/test_object_proxy.rb", "test/test_object_proxy_safe_hash.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
