# frozen_string_literal: true

module HexletCode
  class Submit
    include Tag

    attr_reader :tag, :attrs

    def initialize(value)
      @tag = INPUT
      @attrs = { type: :submit, value: }
    end

    def paired?
      false
    end
  end
end
