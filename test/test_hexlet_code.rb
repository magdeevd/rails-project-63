# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_empty_form
    user = User.new name: 'rob'

    actual = HexletCode.form_for user, url: '/users'

    assert { actual == get_expected_form_html('empty_form') }
  end

  def test_default_url
    user = User.new name: 'rob'

    actual = HexletCode.form_for user

    assert { actual == get_expected_form_html('form_with_default_action') }
  end

  def test_textarea
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    actual = HexletCode.form_for user do |f|
      f.input :job, as: :text
    end

    assert { actual == get_expected_form_html('form_with_textarea') }
  end

  def test_input
    user = User.new name: 'rob', job: '', gender: 'm'

    actual = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
    end

    assert { actual == get_expected_form_html('form_with_input') }
  end

  def test_changed_default_attrs
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    actual = HexletCode.form_for user, url: '/users' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert { actual == get_expected_form_html('form_with_resized_textarea') }
  end

  def test_not_existing_field
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.input :age
    end
  rescue NoMethodError => e
    assert_match("undefined method `age' for", e.message)
  end

  def test_submit
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    actual = HexletCode.form_for user, url: '#', &:submit

    assert { actual == get_expected_form_html('form_with_submit') }
  end

  def test_submit_with_value
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    actual = HexletCode.form_for user, url: '#' do |f|
      f.submit 'Wow'
    end

    assert { actual == get_expected_form_html('submit_with_value') }
  end

  def test_form_with_extra_attr
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    actual = HexletCode.form_for user, url: '/profile', method: :get, class: 'hexlet-form'

    assert { actual == get_expected_form_html('form_with_class') }
  end

  def test_wrong_as_attr_value
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    HexletCode.form_for user, url: '/users' do |f|
      f.input :job, as: :car
    end
  rescue ArgumentError => e
    assert_match('Wrong type for input, use :text or :string', e.message)
  end
end
