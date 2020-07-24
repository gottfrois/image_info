# ImageInfo

[![Code Climate](https://codeclimate.com/github/gottfrois/image_info/badges/gpa.svg)](https://codeclimate.com/github/gottfrois/image_info)
[![Build Status](https://travis-ci.org/gottfrois/image_info.svg)](https://travis-ci.org/gottfrois/image_info)
[![Dependency Status](https://gemnasium.com/gottfrois/image_info.svg)](https://gemnasium.com/gottfrois/image_info)
[![Gem Version](https://badge.fury.io/rb/image_info.svg)](http://badge.fury.io/rb/image_info)

ImageInfo finds the size and type of a single or multiple images from the web by fetching as little data as needed (partial image) in batches.

## Why

In [LinkThumbnailer](https://github.com/gottfrois/link_thumbnailer) I needed to find images sizes not only for one image.
A well known gem like FastImage was not enough so I decided to build my own.
The gem use [typhoeus](https://github.com/typhoeus/typhoeus)'s parallel requests and stream capability under the hood to
get images.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_info'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_info

## Usage

For a single image:

```ruby
image = ImageInfo.from('http://foo.com/foo.png').first
image.width
 => 256
image.height
 => 256
image.size
 => [256, 256]
image.type
 => :png
image.uri
 => #<URI::HTTP:0x007fe7dccc1390 URL:http://foo.com/foo.png>
```

For multiple images:

```ruby
images = ImageInfo.from(['http://foo.com/foo.png', 'http://foo.com/bar.jpg'])
images.map &:size
 => [[256, 256], [128, 128]]
images.map &:type
 => [:png, :jpeg]
```

## Configuration

### Concurrency

You can configure the `max_concurrency` value (20 by default) used to fetch images in parallel:

```ruby
ImageInfo.configure do |config|
  config.max_concurrency = 10
end
```

or at runtime:

```ruby
ImageInfo.from('http://foo.com/foo.png', max_concurrency: 10)
```

### Image Size Limit

You can set a `max_image_size` for which the connection will be aborted
if reached.

```ruby
ImageInfo.configure do |config|
  config.max_image_size = 5 * 1024 * 1024 # 5Mb
end
```

or at runtime:

```ruby
ImageInfo.from('http://foo.com/foo.png', max_image_size: -1)
```

Setting the value to zero or a negative number simply disable the limit.
By default it is set to `-1`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gottfrois/image_info.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
