require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tag do
    t = Tagging.new :tag => Tag.new(:name => 'some_tag')
    t.tag
  end
end
