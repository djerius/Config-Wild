use Test::More;
BEGIN { use_ok( 'Config::Wild' ) }

subtest autoload => sub {

    my $cfg = Config::Wild->new( 'cfgs/test.cnf' );

    is( $cfg->foo, 'ok', 'autoload' );
};

subtest blanks => sub {

    my $cfg = Config::Wild->new( 'cfgs/blanks.cnf' );

    is( $cfg->get( 'foo' ), 'bar',  'trailing blanks' );
    is( $cfg->get( 'too' ), 'good', 'leading blanks' );

};

subtest variables => sub {

    my $cfg = Config::Wild->new( 'cfgs/vars.cnf' );

    is( $cfg->get( 'twig' ), 'here/there', 'internal vars' );

    local $ENV{CWTEST} = 'not now';

    is( $cfg->get( 'entvar' ), 'not now or then', 'env vars' );

    is( $cfg->get( 'bothvarenv' ), 'not now or where', 'both vars (env)' );

    is( $cfg->get( 'bothvarint' ), 'here or not', 'both vars (internal)' );

    is( $cfg->get( 'nest3' ), '0/1/2/3', 'nested internal' );

    is(
        $cfg->get( 'enest2' ),
        'not now/or then/or how',
        'nested internal/env'
    );

    done_testing;


};


subtest wildcard => sub {

    my $cfg = Config::Wild->new( 'cfgs/wildcard.cnf' );

    is( $cfg->get( 'goo_1' ),   1234, 'wildcard 1' );
    is( $cfg->get( 'foo_cas' ), 5678, 'wildcard 2' );

    done_testing;

};

subtest 'absolute include' => sub {

    my $cfg = Config::Wild->new( 'cfgs/include0.cnf' );

    is( $cfg->get( 'foo' ), 1.234, 'include' );
};

subtest 'relative include' => sub {
    my $cfg = Config::Wild->new( 'include0-rel.cnf', { dir => 'cfgs' } );

    is( $cfg->get( 'foo' ), 1.234, 'include' );
};


done_testing;
