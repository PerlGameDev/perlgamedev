use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'perlgamedev' }
BEGIN { use_ok 'perlgamedev::Controller::Admin' }

ok( request('/admin')->is_success, 'Request should succeed' );
done_testing();
