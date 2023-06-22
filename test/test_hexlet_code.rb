# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_form_for_with_url
    user_class = Struct.new(:name, :job, keyword_init: true)
    user = user_class.new name: "rob"

    assert { HexletCode.form_for user, url: "/users" == '<form action="/users" method="post"></form>' }
  end

  def test_form_for_without_url
    user_class = Struct.new(:name, :job, keyword_init: true)
    user = user_class.new name: "rob"

    assert { HexletCode.form_for user == '<form action="#" method="post"></form>' }
  end
end
