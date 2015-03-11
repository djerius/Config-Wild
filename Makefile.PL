use inc::Module::Install;

name 'Config-Wild';
license 'gpl3';
auto_license( holder => 'Smithsonian Astrophysical Observatory' );
all_from 'lib/Config/Wild.pm';

author_tests( 'xt' );

cpanfile;

WriteAll;
