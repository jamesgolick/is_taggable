require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tag do
    Post.new.tags.build
  end

  expect Tagging do
    Post.new.taggings.build
  end

  expect ["something cool", "something else cool"] do
    p = Post.new :tag_list => "something cool, something else cool"
    p.tag_list
  end
end
