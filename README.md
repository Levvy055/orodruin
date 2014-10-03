# Orodruin

Easy convention management system.

It provides:

- Blogging platform
- Attendees, volunteers and speakers management
- Resources distribution
- Events
- Communication
- Data sharing
- User-friendly API with OAuth2 provider

## Why bother?

I've created this system as a replacement for [SZIM][SZIM], which was created
by my friend in PHP as a management system for [Pyrkon][Pyrkon]. It is quite
nice tool, but lack some flexibility and API for developers.

Also I needed to create e-learning platform for volunteers, and SZIM doesn't
provide any tool that will allow work them together.

## Usage

You will need:

- \*NIX system to run (on Windows I suggest you to create VM)
- [Bower][bower]
- Ruby 2.1.2
- Bundler

The best way to install Ruby is using [rbenv][rbenv].

1. Clone this repo using

        git clone https://github.com/hauleth/orodruin.git

2. Install all dependencies

        bundle install
        bower install

3. Check if all tests pass

        ./bin/rake test

4. Run server

        ./bin/foreman start

5. Visit <http://localhost:5000>.

## Badges

* project build
  [![Build Status](https://travis-ci.org/hauleth/orodruin.svg?branch=master)](https://travis-ci.org/hauleth/orodruin)
  [![Code Climate](https://codeclimate.com/github/hauleth/orodruin.png)](https://codeclimate.com/github/hauleth/orodruin)
  [![Coverage Status](https://coveralls.io/repos/hauleth/orodruin/badge.png)](https://coveralls.io/r/hauleth/orodruin)
* documentation
  [![Inline docs](http://inch-ci.org/github/hauleth/orodruin.png)](http://inch-ci.org/github/hauleth/orodruin)
* deps/security
  [![Dependency Status](https://gemnasium.com/hauleth/orodruin.svg)](https://gemnasium.com/hauleth/orodruin)
  [![Security](https://hakiri.io/github/hauleth/orodruin/master.svg)](https://hakiri.io/github/hauleth/orodruin/master)
* design/progress
  [![Stories in Ready](https://badge.waffle.io/hauleth/orodruin.png?label=ready)](https://waffle.io/hauleth/orodruin)
  [![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/hauleth/orodruin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Contribution

Before anything read `CONTRIBUTION.md`.

1. Fork repo
2. Clone repo
3. Create branch

        git checkout -b my-new-cool-feature

4. Write code & tests
5. Check if all tests pass

        ./bin/rake test

6. Push & create pull request

[SZIM]: http://projektszim.wordpress.com/ "System Zarządzania Imprezami Masowymi"
[Pyrkon]: http://www.pyrkon.pl/ "Pyrkon - Poznań's Fantasy Convention'"
[bower]: http://bower.io/ "Bower package manager"
[rbenv]: https://github.com/sstephenson/rbenv "Ruby version manager"
