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
- N/A

### Fixed
- N/A

### Security
- N/A

## [0.25.0] - 2024-11-22

### Added
- Allow setting `description:` to `StaticSelect`, `MultiStaticSelect`, `RadioButtons`, & any `OptionGroup`s. (#195 by @resputin)


## [0.24.0] - 2024-04-07

### Added

- Added support for Rich Text Block via `Slack::BlockKit::Layout::RichText` (#185 by @GetOutOfMyBakery)


### Changed
- Codecov reporting via GitHub Actions OIDC (#188 by @CGA1123)
- Rubygems releasing via GitHub Actions OIDC (#188 by @CGA1123)

## [0.23.0] - 2023-08-07

### Added

- Added ability to set `emoji` property via `Slack::BlockKit::Blocks#input` (#175 by @bmorton)
- Added ability to set `emoji` property via `Slack::BlockKit::Element::RadioButtons#option` (#175 by @bmorton)

## [0.22.0] - 2023-08-05

### Added
- Added `Slack::BlockKit::Element::NumberInput` (#169 by @CGA1123)
- Added `response_url_enabled` parameter to following elements (#171 by @rinasergeeva):
  - `Slack::BlockKit::Element::ChannelsSelect`
  - `Slack::BlockKit::Element::ConversationsSelect`
- Added `default_to_current_conversation` parameter to following elements (#171 by @rinasergeeva):
  - `Slack::BlockKit::Element::ConversationsSelect`
  - `Slack::BlockKit::Element::MultiConversationsSelect`

## [0.21.0] - 2023-02-19

### Added
- `Slack::BlockKit::Element::UrlTextInput` (#164 by @dimerman)
- `Slack::BlockKit::Element::EmailTextInput` (#166 by @CGA1123)
- `Slack::BlockKit::Element::Datetimepicker` (#167 by @CGA1123)

## [0.20.0] - 2022-09-25

### Added
- Added `focus_on_load` parameter to following elements (#153 by @aka-nez):
  - `Slack::BlockKit::Element::ChannelsSelect`
  - `Slack::BlockKit::Element::Checkboxes`
  - `Slack::BlockKit::Element::ConversationsSelect`
  - `Slack::BlockKit::Element::Datepicker`
  - `Slack::BlockKit::Element::ExternalSelect`
  - `Slack::BlockKit::Element::MultiChannelsSelect`
  - `Slack::BlockKit::Element::MultiConversationsSelect`
  - `Slack::BlockKit::Element::MultiExternalSelect`
  - `Slack::BlockKit::Element::MultiStaticSelect`
  - `Slack::BlockKit::Element::MultiUsersSelect`
  - `Slack::BlockKit::Element::PlainTextInput`
  - `Slack::BlockKit::Element::RadioButtons`
  - `Slack::BlockKit::Element::StaticSelect`
  - `Slack::BlockKit::Element::Timepicker`
  - `Slack::BlockKit::Element::UsersSelect`

## [0.19.0] - 2022-09-05

### Added
- Added `Slack::BlockKit::Layout::Video` (#152 by @jcat4)

This adds support for Slack's new Video Block.

See: https://api.slack.com/reference/block-kit/blocks#video


## [0.18.0] - 2022-08-26

### Added
- `Slack::BlockKit::Layout::Input#Timepicker`
- `Slack::BlockKit::Layout::Actions#timepicker`
- `Slack::BlockKit::Layout::Section#timepicker`

### Changed
- `Slack::BlockKit::Element::Timepicker.initialize` now accepts `initial:`, `emoji:`, `placeholder:`
- Rename `Slack::BlockKit::Element::DatePicker` to `Datepicker`
- Rename `Slack::BlockKit::Layout::Actions#date_picker` to `#datepicker`
- Rename `Slack::BlockKit::Layout::Section#date_picker` to `#datepicker`
- `Slack::BlockKit::Blocks#input` now supports passing through the `optional:` parameter (@sophieklm)

### Removed
- `Slack::BlockKit::Element::Timepicker#placeholder`
- `Slack::BlockKit::Element::Timepicker#initial_time`


## [0.17.0] - 2021-06-28

### Added
- `Slack::BlockKit::Formatting` with utility functions for Slack text formatting (#98 by @CGA1123)


## [0.16.0] - 2021-06-23

This release contains a breaking change on the `Layout::Actions` interface.

### Added
- Added new `Layout::Actions#checkboxes` method (#96 by @ryanwilsonperkin)

### Removed
- `Layout::Actions#converstation_select` (use `#conversation_select` instead) (#97 by @ryanwilsonperkin)

### Fixed
- Fixed name of method in `Layout::Actions` to be `conversation_select` (#97 by @ryanwilsonperkin)


## [0.15.0] - 2021-06-14

### Added
- Support `dispatch_action` and `dispatch_action_config` (#94 by @deecewan)


## [0.14.1] - 2021-05-05

### Fixed
- Allow Layout::Section to render without `text` (#87 by @pbendersky)


## [0.14.0] - 2021-02-06

### Added
- `Slack::BlockKit::Blocks#header` (#74 by @rspeicher)


## [0.13.0] - 2020-12-29

### Added
- Ruby3 Support
- `Slack::BlockKit::Element::Timepicker` (#72)
- Add `input` to `Slack::BlockKit::Blocks` and elements to `Slack::BlockKit::Layout::Input` (#73)

### Changed
- Development dependencies now managed by bundler via Gemfile, rather than in gemspec


## [0.12.0] - 2020-10-06

### Added
- `Slack::BlockKit::Layout::Header` (#57)

### Removed
- `Slack::BlockKit::Element::Checkboxes#initial`, use the `initial:` keyword on `#option`
- `Slack::BlockKit::Element::MultiStaticSelect#initial`, use the `initial:` keyword on `#option`
- `Slack::BlockKit::Element::StaticSelect#initial`, use the `initial:` keyword on `#option`


## [0.11.0] - 2020-10-03

### Added
- Add `Slack::BlockKit::Element::RadioButtons` (#52 by @caalberts)

### Changed
- Internal refactoring of `#confirmation_dialog` methods into a shared `Confirmable` module. (#48)

### Fixed
- Ruby2.7 kwarg deprecation warnings


## [0.10.0] - 2020-09-11

### Added
- Add `Slack::BlockKit::Element::Checkboxes` (#44 by @caalberts)

### Fixed
- Fixed initial options in multi select blocks (#46 by @caalberts)


[Unreleased]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.25.0...HEAD
[0.25.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.24.0...v0.25.0
[0.24.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.23.0...v0.24.0
[0.23.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.22.0...v0.23.0
[0.22.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.21.0...v0.22.0
[0.21.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.20.0...v0.21.0
[0.20.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.19.0...v0.20.0
[0.19.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.18.0...v0.19.0
[0.18.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.17.0...v0.18.0
[0.17.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.16.0...v0.17.0
[0.16.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.15.0...v0.16.0
[0.15.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.14.1...v0.15.0
[0.14.1]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.14.0...v0.14.1
[0.14.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.13.0...v0.14.0
[0.13.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.12.0...v0.13.0
[0.12.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.11.0...v0.12.0
[0.11.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/CGA1123/slack-ruby-block-kit/compare/v0.9.0...v0.10.0
