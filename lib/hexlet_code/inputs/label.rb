# frozen_string_literal: true

module HexletCode
  class Label
    include Tag

    attr_reader :tag, :attrs

    def initialize(name)
      @tag = 'label'
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
