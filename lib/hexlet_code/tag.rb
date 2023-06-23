# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attrs = {}, &block)
      paired = %w[div label form textarea]
      unpaired = %w[br input img]

      if paired.include? name
        build_paired(name, attrs, &block)
      elsif unpaired.include? name
        build_unpaired(name, attrs)
      else
        raise ArgumentError, "Tag not supported"
      end
    end

    def self.build_unpaired(name, attrs = {})
      ["<#{name}", !attrs.empty? ? " #{stringify_attrs(attrs)}" : "", ">"].join
    end

    def self.build_paired(name, attrs = {}, &block)
      ["<#{name}", !attrs.empty? ? " #{stringify_attrs(attrs)}" : "", ">", block&.call || "", "</#{name}>"].join
    end

    def self.stringify_attrs(attrs = {})
      attrs.map { |attr, value| "#{attr}=\"#{value}\"" }.join(" ")
    end

    private_class_method :stringify_attrs, :build_paired, :build_unpaired
  end
end
