# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(tag, &block)
      if tag.paired?
        build_paired(tag.name, tag.attrs, &block)
      else
        build_unpaired(tag.name, tag.attrs)
      end
    end

    def self.build_unpaired(name, attrs = {})
      ["<#{name}", attrs.empty? ? '' : " #{stringify_attrs(attrs)}", '>'].join
    end

    def self.build_paired(name, attrs = {})
      ["<#{name}", attrs.empty? ? '' : " #{stringify_attrs(attrs)}", '>', yield, "</#{name}>"].join
    end

    def self.stringify_attrs(attrs = {})
      attrs.map { |attr, value| "#{attr}=\"#{value}\"" }.join ' '
    end
  end
end
