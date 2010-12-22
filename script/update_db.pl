use strict;
use warnings;
use DBI;

unlink 'test.db';

`sqlite3 test.db <schema.sql`;

`script/perlgamedev_create.pl model DB DBIC::Schema perlgamedev::Schema create=static 'dbi:SQLite:dbname=test.db' '' ''`;

