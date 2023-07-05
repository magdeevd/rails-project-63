# frozen_string_literal: true

module HexletCode
  module FormBuilder
    def self.build(form)
      Tag.build(form) do
        form.content.map { |input| Tag.build(input) { input.content } }.join
      end
    end
  end
end
