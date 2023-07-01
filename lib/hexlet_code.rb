# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :StringInput, 'hexlet_code/inputs/string_input'
  autoload :TextInput, 'hexlet_code/inputs/text_input'
  autoload :Submit, 'hexlet_code/inputs/submit'
  autoload :Label, 'hexlet_code/inputs/label'
  autoload :Form, 'hexlet_code/form'

  def self.form_for(entity, attrs = {})
    form = Form.new(entity, attrs)
    yield(form) if block_given?
    form.build
  end
end
