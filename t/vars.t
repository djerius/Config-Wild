use Test::More;
BEGIN { use_ok('Config::Wild') };

my $cfg = Config::Wild->new( 'cfgs/vars.cnf' );

ok( 'here/there' eq $cfg->value('twig'), 'internal vars' );

$ENV{CWTEST} = 'not now';

ok( 'not now or then' eq $cfg->value( 'entvar' ), 'env vars' );

ok( 'not now or where' eq $cfg->value( 'bothvarenv' ), 'both vars (env)' );

ok( 'here or not' eq $cfg->value( 'bothvarint' ), 'both vars (internal)' );

ok( '0/1/2/3' eq $cfg->value( 'nest3' ), 'nested internal' );

ok( 'not now/or then/or how' eq $cfg->value( 'enest2' ), 'nested internal/env' );

done_testing;
