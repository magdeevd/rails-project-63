[![CI](https://github.com/magdeevd/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/magdeevd/rails-project-63/actions/workflows/main.yml)
[![hexlet-check](https://github.com/magdeevd/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/magdeevd/rails-project-63/actions/workflows/hexlet-check.yml)
# HexletCode

## Installation

    $ make setup

## Usage

```
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end

#<form action="#" method="post">
#  <input name="name" type="text" value="rob" class="user-input">
#  <input name="job" type="text" value="">
#</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
