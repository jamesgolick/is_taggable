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

  expect ["something cool", "something new"] do
    p = Post.new :tag_list => "something cool, something else cool"
    p.save!
    p.tag_list = "something cool, something new"
    p.save!
    p.tags.reload
    p.instance_variable_set("@tag_list", nil)
    p.tag_list
  end
end
