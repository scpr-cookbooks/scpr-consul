# scpr-consul
[![CircleCI](https://circleci.com/gh/scpr-cookbooks/scpr-consul.svg?style=svg)](https://circleci.com/gh/scpr-cookbooks/scpr-consul)

A cookbook to configure consul and consul-template

## Pushing out updates

1. bump the version in metadata.rb
1. `berks install`
1. `berks upload`

## Testing

Requirements:
* chef-dk  (`brew install chef`)

Currently, tests only pass with the `ubuntu-1204` platform. To run these tests:

`kitchen verify server.*12`
