require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tagging do
    Tag.new.taggings.proxy_reflection.klass
  end

  expect Tag.new(:name => "duplicate").not.to.be.valid? do
    Tag.create!(:name => "duplicate")
  end

  expect Tag.new.not.to.be.valid?
  expect String do
    t = Tag.new
    t.valid?
    t.errors[:name]
  end

  expect Tag.create!(:name => "iamawesome") do
    Tag.find_or_initialize_with_name_like("iaMawesome")
  end

  expect Tag.create!(:kind => "language", :name => "French") do
    Tag.of_kind("language").first
  end
end
