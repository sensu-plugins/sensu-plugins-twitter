## Sensu-Plugins-twitter

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-twitter.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-twitter)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-twitter.svg)](http://badge.fury.io/rb/sensu-plugins-twitter)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-twitter/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-twitter)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-twitter/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-twitter)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-twitter.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-twitter)

## Functionality

## Files
 * bin/handler-twitter

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-twitter -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-twitter`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-twitter' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-twitter' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
