use Test::More;
BEGIN { use_ok('Config::Wild') };

my $cfg = Config::Wild->new( 'cfgs/test.cnf' );

ok ( 'ok' eq $cfg->foo, 'autoload' );

done_testing;
