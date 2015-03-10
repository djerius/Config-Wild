#!perl

on runtime => sub {

    requires 'Lingua::Boolean::Tiny';
    requires 'List::Util' => 1.24;
    requires 'File::pushd';
    requires 'Path::Tiny';

};

on test => sub {

    requires 'Test::More';
    requires 'Test::Fatal';
    requires 'Path::Tiny';
    requires 'File::pushd';
    requires 'Test::TempDir::Tiny';

};

on develop => sub {

    requires 'Module::Install::AuthorTests';
    requires 'Module::Install::AutoLicense';
    requires 'Test::CPAN::Changes';
    requires 'Test::NoBreakpoints';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
    requires 'Test::Perl::Critic';

};
