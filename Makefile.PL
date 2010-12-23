#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'perlgamedev';
all_from 'lib/perlgamedev.pm';

requires 'Catalyst::Runtime'                => '5.80029';
requires 'Catalyst::Plugin::ConfigLoader'   => '0.30';
requires 'Catalyst::Plugin::Static::Simple' => '0.29';
requires 'Catalyst::Action::RenderView'     => '0.14';
requires 'DBIx::Class'                      => '0.08124';
requires 'Catalyst::Model::DBIC::Schema'    => '0.48';
requires 'Catalyst::View::TT'               => '0.36';
requires 'Catalyst::Plugin::Session' => '0.31';
requires 'Catalyst::Plugin::Session::State::Cookie' => '0.17';
requires 'Catalyst::Plugin::Session::Store::FastMmap' => '0.14';
requires 'DBD::SQLite'                      => '1.31';
requires 'Moose'                            => '1.21';
requires 'namespace::autoclean'             => '0.11';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.96';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
