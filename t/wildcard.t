use Test::More;
BEGIN { use_ok('Config::Wild') };

my $cfg = Config::Wild->new( 'cfgs/wildcard.cnf' );

ok( 1234 == $cfg->value('goo_1'), 'wildcard 1' );
ok( 5678 == $cfg->value('foo_cas'), 'wildcard 2' );

done_testing;
