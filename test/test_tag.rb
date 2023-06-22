# frozen_string_literal: true

require "test_helper"

class TestTag < Minitest::Test
  def test_build_simple_unpaired_tag
    assert { HexletCode::Tag.build("br") == "<br>" }
  end

  def test_build_unpaired_tag_with_one_attr
    assert { HexletCode::Tag.build("img", src: "path/to/image") == '<img src="path/to/image">' }
  end

  def test_build_unpaired_tag_with_many_attrs
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save") == '<input type="submit" value="Save">' }
  end

  def test_build_simple_paired_tag
    assert { HexletCode::Tag.build("div") == "<div></div>" }
  end

  def test_build_paired_tag_with_text
    assert { HexletCode::Tag.build("label", for: "email") { "Email" } == '<label for="email">Email</label>' }
  end

  def test_not_supported_tag
    assert { HexletCode::Tag.build("ball") }
  rescue ArgumentError => e
    assert_match("Tag not supported", e.message)
  end
end
