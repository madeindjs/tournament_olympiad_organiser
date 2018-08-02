# TournamentOrganizer

The goal is to make a **tournament** where all **players** play **each other** on differents **games** in differents **rounds** (not a the same time, of course..)

## Installation

Add this to your Gemfile


```ruby
gem 'tournament_organizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tournament_organizer

## Usage

~~~bash
$ tournament_organizer --games "Foot,Basket" --players "Jean,Yves,Alex" --output yaml
---
- - :players:
    - Jean
    - Yves
    :game: Foot
- - :players:
    - Alex
    - Jean
    :game: Foot
- - :players:
    - Alex
    - Yves
    :game: Foot
~~~

Output format disponnible are YAML, JSON & HTML. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tournament_organizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TournamentOrganizer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tournament_organizer/blob/master/CODE_OF_CONDUCT.md).

## Todo

- [ ] Add option to set number of player per game
- [ ] Add Javascript to HTML output to click on winner 
