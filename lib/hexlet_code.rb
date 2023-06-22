# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload :Tag, "hexlet_code/tag"

  def self.form_for(entity, url: "#")
    Tag.build("form", { action: url, method: "post" })
  end
end
