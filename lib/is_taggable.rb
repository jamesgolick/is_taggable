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

        has_many   :taggings, :as      => :taggable
        has_many   :tags,     :through => :taggings
        after_save :save_tags
      end
    end

    module InstanceMethods
      def tag_list=(list)
        @tag_list = list.is_a?(Array) ? list : list.split(', ')
      end

      def tag_list
        @tag_list ||= tags.map(&:name)
      end

      protected
        def save_tags
          delete_unused_tags
          add_new_tags
          taggings.each(&:save)
        end

        def delete_unused_tags
          tags.each { |t| tags.delete(t) unless tag_list.include?(t.name) }
        end

        def add_new_tags
          tag_names = tags.map(&:name)
          tag_list.each { |tag_name| tags << Tag.find_or_initialize_with_name_like(tag_name) unless tag_names.include?(tag_name) }
        end
    end
  end
end

ActiveRecord::Base.send(:extend, IsTaggable::ActiveRecordExtension)
