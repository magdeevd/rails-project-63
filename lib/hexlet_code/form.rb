# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  class Form
    include Tag

    attr_reader :tag, :attrs

    def initialize(entity, attrs = {})
      @tag = FORM
      @attrs = { action: attrs[:url] || '#', method: :post }.merge(attrs.except(:url))
      @entity = entity
      @tags = []
    end

    def paired?
      true
    end

    def content
      @tags.map(&:build).join
    end

    def input(field_name, attrs = {})
      value = @entity.public_send(field_name)

      @tags << Label.new(field_name)

      @tags << get_input_class(attrs[:as]).new(field_name, value, attrs.except(:as))
    end

    def submit(value = 'Save')
      @tags << Submit.new(value)
    end

    private

    def get_input_class(as)
      as ||= :string
      raise ArgumentError, 'Wrong type for input, use :text or :string' unless %i[text string].include?(as)

      "HexletCode::#{as.capitalize}Input".constantize
    end
  end
end
