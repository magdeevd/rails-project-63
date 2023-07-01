# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

require 'minitest/autorun'

def get_expected_form_html(name)
  File.read("./test/data/forms/#{name}.html")
end
