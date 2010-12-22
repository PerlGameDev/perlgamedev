package perlgamedev::Schema::Result::GamesTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

perlgamedev::Schema::Result::GamesTag

=cut

__PACKAGE__->table("GamesTag");

=head1 ACCESSORS

=head2 id

  data_type: 'int'
  is_nullable: 0

=head2 gameid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 tagid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "int", is_nullable => 0 },
  "gameid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "tagid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 tagid

Type: belongs_to

Related object: L<perlgamedev::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
  "tagid",
  "perlgamedev::Schema::Result::Tag",
  { id => "tagid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 gameid

Type: belongs_to

Related object: L<perlgamedev::Schema::Result::Game>

=cut

__PACKAGE__->belongs_to(
  "gameid",
  "perlgamedev::Schema::Result::Game",
  { id => "gameid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-12-22 16:15:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2ZgqNdw3THVeYKlFF6bzyA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
