use Test::More;
BEGIN { use_ok('Config::Wild') };

my $cfg = Config::Wild->new( 'cfgs/blanks.cnf' );

ok( 'bar' eq $cfg->value('foo'), 'trailing blanks' );
ok( 'good' eq $cfg->value('too'), 'leading blanks' );

done_testing;
