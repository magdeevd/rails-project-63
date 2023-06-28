# frozen_string_literal: true

module HexletCode
  class Submit
    include Tag

    attr_reader :tag, :attrs

    def initialize(value)
      @tag = "input"
      @attrs = { type: "submit", value: value }
    end

    def paired?
      false
    end
  end
end
