require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tagging do
    Tag.new.taggings.proxy_reflection.klass
  end

  expect Tag.new(:name => "duplicate").not.to.be.valid? do
    Tag.create!(:name => "duplicate")
  end
end
