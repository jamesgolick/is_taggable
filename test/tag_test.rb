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
end
