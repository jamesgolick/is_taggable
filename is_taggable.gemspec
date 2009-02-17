# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{is_taggable}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Haran", "James Golick", "GiraffeSoft Inc."]
  s.date = %q{2009-02-16}
  s.email = %q{chebuctonian@mgmail.com}
  s.files = ["README.rdoc", "VERSION.yml", "generators/is_taggable_migration", "generators/is_taggable_migration/is_taggable_migration_generator.rb", "generators/is_taggable_migration/templates", "generators/is_taggable_migration/templates/migration.rb", "lib/is_taggable.rb", "lib/tag.rb", "lib/tagging.rb", "test/is_taggable_test.rb", "test/tag_test.rb", "test/tagging_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/giraffesoft/is_taggable}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{tagging that doesn't want to be on steroids. it's skinny and happy to stay that way.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
