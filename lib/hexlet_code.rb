# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload :Tag, "hexlet_code/tag"
  autoload :Input, "hexlet_code/inputs/input"
  autoload :Textarea, "hexlet_code/inputs/textarea"
  autoload :Submit, "hexlet_code/inputs/submit"
  autoload :Label, "hexlet_code/inputs/label"
  autoload :Form, "hexlet_code/form"

  def self.form_for(entity, url: "#")
    f = Form.new(entity, url)
    yield(f) if block_given?
    f.build
  end
end
