# frozen_string_literal: true

module HexletCode
  class StringInput < InputBase
    def initialize(name, value, attrs = {})
      super()
      @attrs = { name:, type: :text, value: }.merge(attrs)
    end
  end
end
