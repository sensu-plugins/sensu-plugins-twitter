#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## Unreleased

## [2.0.0] - 2018-12-24
### Added 
- Bump sensu-plugin runtime dep to 3.0 with Sensu Go to Sensu Core 1.x migration option (@jspaleta)
- Added 2.5.1 ruby support (@jspaleta)
- Added --verbose cmdline switch to aid in local testing
- Added --disable_update cmdline switch to aid in local testing

### Breaking Changes
- Dropped 2.0 ruby support (@jspaleta)
- Dropped 2.1 ruby support (@jspaleta)
- Dropped 2.2 ruby support (@jspaleta)

### Changed
- Bump twitter runtime dep to 6.2.0 (@jspaleta)
- Bump codeclimate development dep to 1.0 (@jspaleta)
- Bump rake development dep to 12.3 (@jspaleta)
- Bump rubocop development dep to 0.60.0 (@jspaleta)
- Bump yard development dep to 0.9.11 (@jspaleta)
- Added explict rdoc development dep needed for ruby 2.5.1 (@jspaleta)
- Updated .rubocop.yml to disable unneeded warning messages (@jspaleta)
- Updated Rakefile and introduce quick task (@jspaleta)
- Updated .travis.yml to use quick task (@jspaleta)
- Clean up robucop warnings (@jspaleta)

## [1.0.0] - 2017-07-06
### Added
- Ruby 2.3.0 & 2.4.1 testing

### Breaking Changes
- Dropped Ruby 1.9.3 support

## [0.0.4] - 2015-12-09
### Changed
- Use Twitter REST client
- Bump Twitter gem to 5.15.0

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-03
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-twitter/compare/1.0.0...HEAD
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-twitter/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-twitter/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-twitter/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-twitter/compare/0.0.1...0.0.2
