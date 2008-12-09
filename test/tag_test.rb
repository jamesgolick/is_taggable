require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tagging do
    Tag.new.taggings.proxy_reflection.klass
  end
end
