# frozen_string_literal: true

module HexletCode
  class Input
    include Tag

    attr_reader :tag, :attrs

    def initialize(name, value, attrs = {})
      @tag = 'input'
      @attrs = { name:, type: 'text', value: }.merge(attrs)
    end

    def paired?
      false
    end
  end
end
