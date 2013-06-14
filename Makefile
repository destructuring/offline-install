SHELL := /bin/bash

### MAIN
all:
	@bundle exec chef-local -c etc/chef/solo.rb -j config/offline-install.json

### CACHE

cache: git_cache squid_cache

git_cache:
	bin/build cache git

squid_cache:
	bin/build cache squid

apt_cache:
	bin/build cache apt precise raring
