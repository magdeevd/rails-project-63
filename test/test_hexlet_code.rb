# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_empty_form
    user = User.new name: "rob"

    assert { HexletCode.form_for user, url: "/users" == '<form action="/users" method="post"></form>' }
  end

  def test_default_url
    user = User.new name: "rob"

    assert { HexletCode.form_for user == '<form action="#" method="post"></form>' }
  end

  def test_input
    user = User.new name: "rob", job: "hexlet", gender: "m"

    actual = HexletCode.form_for user do |f|
      f.input :name
    end

    expected = "<form action=\"#\" method=\"post\">"\
"<label for=\"name\">Name</label>"\
"<input name=\"name\" type=\"text\" value=\"rob\">"\
"</form>"

    assert { actual == expected }
  end

  def test_textarea
    user = User.new name: "rob", job: "hexlet", gender: "m"

    actual = HexletCode.form_for user do |f|
      f.input :job, as: :text
    end

    expected = "<form action=\"#\" method=\"post\">"\
"<label for=\"job\">Job</label>"\
"<textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>"\
"</form>"

    assert { actual == expected }
  end

  def test_extra_attrs_in_input
    user = User.new name: "rob", job: "", gender: "m"

    actual = HexletCode.form_for user, url: "#" do |f|
      f.input :name, class: "user-input"
    end

    expected = "<form action=\"#\" method=\"post\">" \
"<label for=\"name\">Name</label>"\
"<input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\">"\
"</form>"

    assert { actual == expected }
  end

  def test_changed_default_attrs
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual = HexletCode.form_for user, url: "/users" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected = "<form action=\"/users\" method=\"post\">"\
"<label for=\"job\">Job</label>"\
"<textarea name=\"job\" cols=\"50\" rows=\"50\">hexlet</textarea>"\
"</form>"

    assert { actual == expected }
  end

  def test_not_existing_field
    user = User.new name: "rob", job: "hexlet", gender: "m"
    HexletCode.form_for user, url: "/users" do |f|
      f.input :name
      f.input :job, as: :text
      f.input :age
    end
  rescue NoMethodError => e
    assert_match("undefined method `age' for", e.message)
  end

  def test_submit
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual = HexletCode.form_for user, url: "#", &:submit

    expected = "<form action=\"#\" method=\"post\"><input type=\"submit\" value=\"Save\"></form>"

    assert { actual == expected }
  end

  def test_submit_with_value
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual = HexletCode.form_for user, url: "#" do |f|
      f.submit "Wow"
    end

    expected = "<form action=\"#\" method=\"post\"><input type=\"submit\" value=\"Wow\"></form>"

    assert { actual == expected }
  end

  def test_form_with_extra_attr
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual = HexletCode.form_for user, url: "/profile", method: :get, class: "hexlet-form"

    expected = '<form action="/profile" method="get" class="hexlet-form"></form>'

    assert { actual == expected }
  end
end
