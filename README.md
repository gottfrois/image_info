# ImageInfo

ImageInfo finds the size and type of a single or multiple images from the web by fetching as little as needed in batches.

## Why

In [LinkThumbnailer](https://github.com/gottfrois/link_thumbnailer) I needed to find images sizes not only for one image.
A well known gem like FastImage was not enough so I decided to build my own.
The gem use [typhoeus](https://github.com/typhoeus/typhoeus) under the hood to perform http requests in parallel.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gottfrois/image_info.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

