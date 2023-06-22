# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attrs = {}, &block)
      paired = %w[div label]
      unpaired = %w[br input img]

      if paired.include? name
        build_paired(name, attrs, &block)
      elsif unpaired.include? name
        build_unpaired(name, attrs)
      else
        raise ArgumentError, "Tag not supported"
      end
    end

    def self.build_unpaired(name, attrs)
      ["<#{name}", attrs_to_string(attrs), ">"].join
    end

    def self.build_paired(name, attrs, &block)
      ["<#{name}", attrs_to_string(attrs), ">", block&.call || "", "</#{name}>"].join
    end

    def self.attrs_to_string(attrs = {})
      attrs.empty? ? "" : attrs.map { |attr, value| "#{attr}=\"#{value}\"" }.join(" ").prepend(" ")
    end

    private_class_method :attrs_to_string, :build_paired, :build_unpaired
  end
end
