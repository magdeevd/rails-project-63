# frozen_string_literal: true

module HexletCode
  class Textarea
    include Tag

    attr_reader :tag, :attrs

    def initialize(name, value, attrs = {})
      @tag = 'textarea'
      @attrs = { name: name, cols: 20, rows: 40 }.merge(attrs)
      @value = value
    end

    def paired?
      true
    end

    def content
      @value
    end
  end
end
