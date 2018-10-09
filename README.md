# scpr-consul

A cookbook to configure consul and consul-template

## Local testing

This uses (kitchen-dokken)[https://github.com/someara/kitchen-dokken] to bring
up a consul server and a client for each supported platform.

1. bundle install
1. bundle exec kitchen converge

## Pushing out updates

1. bump the version in metadata.rb
1. `berks install`
1. `berks upload`
