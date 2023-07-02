# frozen_string_literal: true

module HexletCode
  class TextInput < InputBase
    INPUT_NAME = :textarea

    def initialize(name, value, attrs = {})
      super()
      @attrs = { name:, cols: 20, rows: 40 }.merge(attrs)
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
