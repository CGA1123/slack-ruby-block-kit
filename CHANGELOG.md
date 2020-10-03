# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- N/A

### Changed
- N/A

### Deprecated
- N/A

### Removed
- `Slack::BlockKit::Element::Checkboxes#initial`, use the `initial:` keyword on `#option`
- `Slack::BlockKit::Element::MultiStaticSelect#initial`, use the `initial:` keyword on `#option`
- `Slack::BlockKit::Element::StaticSelect#initial`, use the `initial:` keyword on `#option`


### Fixed
- N/A

### Security
- N/A


---


## [0.11.0] - 2020-10-03

### Added
- Add `Slack::BlockKit::Element::RadioButtons` (#52 by @caalberts)

### Changed
- Internal refactoring of `#confirmation_dialog` methods into a shared `Confirmable` module. (#48)

### Fixed
- Ruby2.7 kwarg deprecation warnings


---


## [0.10.0] - 2020-09-11

### Added
- Add `Slack::BlockKit::Element::Checkboxes` (#44 by @caalberts)

### Fixed
- Fixed initial options in multi select blocks (#46 by @caalberts)


---

See [releases] for previous changes.


[Unreleased]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.11.0...HEAD
[0.11.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.9.0...v0.10.0

[releases]: https://github.com/CGA1123/slack-ruby-block-kit/releases
