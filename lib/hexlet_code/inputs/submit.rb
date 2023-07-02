# frozen_string_literal: true

module HexletCode
  class Submit < InputBase
    def initialize(value)
      super()
      @attrs = { type: :submit, value: }
    end
  end
end
