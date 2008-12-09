path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << path unless $LOAD_PATH.include?(path)
require 'tag'
require 'tagging'

module IsTaggable
  module ActiveRecordExtension
    def is_taggable
      include IsTaggable::TaggableMethods
    end
  end

  module TaggableMethods
    def self.included(klass)
      klass.class_eval do
        include IsTaggable::TaggableMethods::InstanceMethods

        has_many :taggings, :as      => :taggable
        has_many :tags,     :through => :taggings
      end
    end

    module InstanceMethods
      def tag_list=(list)
        list.split(", ").each { |tag_name| tags << Tag.find_or_initialize_with_name_like(tag_name) }
      end

      def tag_list
        tags.map(&:name)
      end
    end
  end
end

ActiveRecord::Base.send(:extend, IsTaggable::ActiveRecordExtension)
