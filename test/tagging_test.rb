require File.dirname(__FILE__) + '/test_helper'

Expectations do
  expect Tag do
    t = Tagging.new :tag => Tag.new(:name => 'some_tag')
    t.tag
  end
  
  expect Post do
    t = Tagging.new :taggable => Post.new
    t.taggable
  end
  
  expect 2 do
    2.times { Post.create(:tag_list => "interesting") }
    Tag.find_by_name("interesting").taggings.count
  end
  
  expect 1 do
    p1 = Post.create(:tag_list => "witty")
    p2 = Post.create(:tag_list => "witty")
    
    p2.destroy
    Tag.find_by_name("witty").taggings.count
  end  

  expect 2 do
    p1 = Post.create(:tag_list => "smart, pretty")
    p1.taggings.count
  end

  expect 1 do
    p1 = Post.create(:tag_list => "mildly, inappropriate")

    Tag.find_by_name('inappropriate').destroy
    p1.taggings.count
  end  
end
