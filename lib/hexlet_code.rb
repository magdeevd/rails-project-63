# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload :Tag, "hexlet_code/tag"
  autoload :Form, "hexlet_code/form"

  def self.form_for(entity, url: "#")
    Tag.build("form", { action: url, method: "post" }) do
      block_given? ? yield(Form.new(entity)) : ""
    end
  end
end
