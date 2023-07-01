# frozen_string_literal: true

module HexletCode
  module Tag
    attr_reader :tag, :attrs

    INPUT = :input
    TEXTAREA = :textarea
    LABEL = :label
    FORM = :form

    def paired?
      false
    end

    def content
      ''
    end

    def build
      if paired?
        build_paired(@tag, content, @attrs)
      else
        build_unpaired(@tag, @attrs)
      end
    end

    private

    def build_unpaired(name, attrs = {})
      ["<#{name}", attrs.empty? ? '' : " #{stringify_attrs(attrs)}", '>'].join
    end

    def build_paired(name, content, attrs = {})
      ["<#{name}", attrs.empty? ? '' : " #{stringify_attrs(attrs)}", '>', content, "</#{name}>"].join
    end

    def stringify_attrs(attrs = {})
      attrs.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
    end
  end
end
