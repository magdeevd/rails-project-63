# frozen_string_literal: true

module HexletCode
  class InputBase
    INPUT_NAME = :input

    attr_reader :attrs

    def name
      self.class.const_get 'INPUT_NAME'
    end

    def paired?
      false
    end

    def content
      ''
    end
  end
end
