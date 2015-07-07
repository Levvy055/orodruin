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

## Usage

You will need [Docker][docker] and [Docker Compose][compose]

1. Clone this repo using

        git clone https://github.com/eriador/orodruin.git

2. Build all needed containers

        docker-compose build

3. Setup database

        docker-compose run web rake db:setup RAILS_ENV=development

4. Run app

        docker-compose up

3. Visit <http://localhost:5000>.

## Badges

* project build
  [![Build Status](https://travis-ci.org/eriador/orodruin.svg?branch=master)](https://travis-ci.org/eriador/orodruin)
  [![Code Climate](https://codeclimate.com/github/eriador/orodruin.png)](https://codeclimate.com/github/eriador/orodruin)
  [![Coverage Status](https://coveralls.io/repos/github/eriador/orodruin/badge.svg?branch=master)](https://coveralls.io/github/eriador/orodruin?branch=master)
* documentation
  [![Inline docs](http://inch-ci.org/github/eriador/orodruin.png)](http://inch-ci.org/github/eriador/orodruin)
* deps/security
  [![Dependency Status](https://gemnasium.com/eriador/orodruin.svg)](https://gemnasium.com/eriador/orodruin)
  [![Security](https://hakiri.io/github/eriador/orodruin/master.svg)](https://hakiri.io/github/eriador/orodruin/master)
* design/progress
  [![Stories in Ready](https://badge.waffle.io/eriador/orodruin.png?label=ready)](https://waffle.io/eriador/orodruin)
  [![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/eriador/orodruin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

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
[docker]: https://www.docker.com/ "Docker is an open platform for developers and sysadmins of distributed applications."
[compose]: https://docs.docker.com/compose/ "Compose is a tool for defining and running complex applications with Docker."
