# frozen_string_literal: true

module HexletCode
  class Form
    include Tag

    attr_reader :tag, :attrs

    def initialize(entity, action = "#")
      @tag = "form"
      @attrs = { action: action, method: "post" }
      @entity = entity
      @tags = []
    end

    def paired?
      true
    end

    def content
      @tags.map(&:build).join
    end

    def input(field, attrs = {})
      value = @entity.public_send(field)

      @tags << Label.new(field)

      @tags << if attrs.key?(:as) && attrs[:as] == :text
                 Textarea.new(field, value, attrs.except(:as))
               else
                 Input.new(field, value, attrs.except(:as))
               end
    end

    def submit(value = "Save")
      @tags << Submit.new(value)
    end
  end
end
