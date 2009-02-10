require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tagging do
    Tag.new.taggings.proxy_reflection.klass
  end

  expect Tag.new(:name => "duplicate").not.to.be.valid? do
    Tag.create!(:name => "duplicate")
  end

  expect Tag.new(:name => "not dup").to.be.valid? do
    Tag.create!(:name => "not dup", :kind => "something")
  end

  expect Tag.new.not.to.be.valid?
  expect String do
    t = Tag.new
    t.valid?
    t.errors[:name]
  end

  expect Tag.create!(:name => "iamawesome", :kind => "awesomestuff") do
    Tag.find_or_initialize_with_name_like_and_kind("iaMawesome", "awesomestuff")
  end

  expect true do
    Tag.create!(:name => "iamawesome", :kind => "stuff")
    Tag.find_or_initialize_with_name_like_and_kind("iaMawesome", "otherstuff").new_record?
  end

  expect Tag.create!(:kind => "language", :name => "french") do
    Tag.of_kind("language").first
  end
end
