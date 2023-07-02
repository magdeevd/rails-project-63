# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  class Form < InputBase
    INPUT_NAME = :form

    def initialize(entity, attrs = {})
      super()
      @attrs = { action: attrs[:url] || '#', method: :post }.merge(attrs.except(:url))
      @entity = entity
      @content = []
    end

    def paired?
      true
    end

    def content
      @content
    end

    def input(field_name, attrs = {})
      value = @entity.public_send(field_name)

      @content << Label.new(field_name)

      @content << get_input_class(attrs[:as]).new(field_name, value, attrs.except(:as))
    end

    def submit(value = 'Save')
      @content << Submit.new(value)
    end

    private

    def get_input_class(as)
      as ||= :string
      raise ArgumentError, 'Wrong type for input, use :text or :string' unless %i[text string].include?(as)

      "HexletCode::#{as.capitalize}Input".constantize
    end
  end
end
