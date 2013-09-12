SHELL := /bin/bash

### MAIN
all:
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle || bundle check; }

squid: all
	@bundle exec chef-local -c etc/chef/solo.rb -j config/squid.json

sshd: all
	@bundle exec chef-local -c etc/chef/solo.rb -j config/sshd.json

### CACHE

cache: git_cache squid_cache

git_cache:
	bin/build cache git

squid_cache:
	bin/build cache squid

apt_cache:
	bin/build cache apt precise raring
