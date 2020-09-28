# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Fixes `URI.encode` obsolete warning by using `Addressable` instead.

## [1.2.0] - 2020-07-24
### Added

- Allows to set a maximum image size in bytes to fetch. The HTTP connection
will be aborted as soon as the max size is reached. Setting a value to
`zero` or a negative number will deactivate this feature. Default to `-1` not
to break retro compatibility.

### Fixed

- Partial image loading was sometime yielding empty results. Image size and
type was not set properly in this case.
- `max_concurrency` option was not properly set by default.
- Locks dependencies to their major version.
  - `typhoeus` is now locked to `~> 1.0`
  - `image_size` is now locked to `~> 2.0`

## [1.1.2] - 2015-08-12
### Fixed

- Fix issues with schemaless uri (ex: `//foo.com`)

## [1.1.1] - 2015-08-11
### Adds

- Adds image partial loading and abort the connection as soon as image
size and type has been found.

### Fixed

- Fixes URL encoding issues.

## [1.1.0] - 2015-07-19
### Adds

- Introduces `width` and `height` method.

## [1.0.0] - 2015-07-19
### Adds

- First release 🎆

[Unreleased]: https://github.com/gottfrois/image_info/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/gottfrois/image_info/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/gottfrois/image_info/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/gottfrois/image_info/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/gottfrois/image_info/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/gottfrois/image_info/releases/tag/v1.0.0
