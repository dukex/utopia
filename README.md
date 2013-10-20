# UtopiaData [![Build Status](https://travis-ci.org/dukex/utopia.png?branch=develop)](https://travis-ci.org/dukex/utopia)[![Code Climate](https://codeclimate.com/github/dukex/utopia.png)](https://codeclimate.com/github/dukex/utopia)[![Dependency Status](https://gemnasium.com/dukex/utopia.png)](https://gemnasium.com/dukex/utopia)

UtopiaData is a (easy)way to expose/open database, with few commands UtopiaData
creates a RESTful API (with **hypermedia**) and **read-only** access to some
resources on database


## Ruby Version Support
  * 2.0.0
  * jruby-19mode
  * rbx-19mode


## Installation

``` bash
  $ gem install utopia_data
  $ utopia_data new my_project
  $ cd my_project
```

## Usage

[examples/](https://github.com/dukex/utopia/tree/master/examples) Examples apps

UtopiaData is a [rack](http://rack.github.io/) project using the [grape](https://github.com/intridea/grape), do you can up the project with any rack server like [puma](http://puma.io/), [unicorn](http://unicorn.bogomips.org/) or [passenger](https://www.phusionpassenger.com/).

To up your project on development you can only run:

``` bash
  $ rackup
```

### Creating Resources

It's very simple create a resource, just run:

``` bash
  $ utopia_data resource my_resource_name
```

By default, UtopiaData use the resource name as the table name on database.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
