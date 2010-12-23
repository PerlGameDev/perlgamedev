package perlgamedev::Controller::Admin;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

perlgamedev::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

Main admin interface to create and delete games

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( games => [ $c->model('DB::Game')->all ] );
}

=head2 create

Create a new game

=cut

sub create :Local :Args(0) {
    my ( $self, $c ) = @_;


    my $game = $c->model('DB::Game')->create({
        name => $c->req->param('name'),
        info => $c->req->param('info'),
        license => $c->req->param('license'),
        url     => $c->req->param('url'),
    });

    $c->flash( message => 'Game created successfully!' );
    $c->res->redirect( $c->uri_for( $self->action_for('index') ) );
}

sub delete :Local :Args(0) {
    my ( $self, $c ) = @_;
    my $id = $c->req->param('game');

    $c->log->debug( "looking up id '$id' for deletion" );
    my $game = $c->model('DB::Game')->find( $id )
        or $c->detach('/error_404');

    $c->log->debug('removing entry ' . $game->id);
    $game->delete;

    $c->flash( message => 'Game deleted successfully!' );
    $c->res->redirect( $c->uri_for( $self->action_for('index') ) );
}

=head1 AUTHOR

garu,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
