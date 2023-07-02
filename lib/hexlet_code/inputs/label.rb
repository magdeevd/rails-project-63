# frozen_string_literal: true

module HexletCode
  class Label < InputBase
    INPUT_NAME = :label

    def initialize(name)
      super()
      @attrs = { for: name }
      @value = name.capitalize
    end

    def paired?
      true
    end

    def content
      @value
    end
  end
end
