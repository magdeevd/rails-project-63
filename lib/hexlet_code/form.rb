# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(entity)
      @entity = entity
      @result = ""
    end

    def input(name, options = {})
      value = @entity.public_send(name)
      @result += if options.key?(:as) && options[:as] == :text
                   render_textarea(name, value, options.except(:as))
                 else
                   render_input(name, value, options.except(:as))
                 end
    end

    private

    def render_textarea(name, value, attrs)
      Tag.build("textarea", { name: name, cols: 20, rows: 40 }.merge(attrs)) { value }
    end

    def render_input(name, value, attrs)
      Tag.build("input", { name: name, type: "text", value: value }.merge(attrs))
    end
  end
end
