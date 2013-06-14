#!/usr/bin/perl

use strict;

my %rewrite = (
  "http://rubygems.org/specs.4.8.gz",
  "http://production.s3.rubygems.org/specs.4.8.gz",
  "http://rubygems.org/gems/bundler-1.2.5.gem",
  "http://bb-m.rubygems.org/gems/bundler-1.2.5.gem",
  "http://rubygems.org/latest_specs.4.8.gz",
  "http://production.s3.rubygems.org/latest_specs.4.8.gz",
  "http://rubygems.org/quick/Marshal.4.8/bundler-1.2.5.gemspec.rz",
  "http://production.cf.rubygems.org/quick/Marshal.4.8/bundler-1.2.5.gemspec.rz" );

use Data::Dumper;

while (my $line = <STDIN>) {
  my @toks = split m{\s+}, $line;

  my $rewritten ="$toks[0]";

  if ($rewrite{$toks[0]}) {
    $rewritten = $rewrite{$toks[0]};
  }

  open (MYFILE, '>>/tmp/rewrite.log');
  print MYFILE "$rewritten\n";
  close (MYFILE); 

  print "$rewritten\n";
  last;
}
