#!perl -T

use warnings;
use strict;

use Test::More tests => 1;

use LWP;
use WWW::Mechanize;
use Test::WWW::Mechanize;

pass( 'Modules loaded' );

diag( "Testing Test::WWW::Mechanize $Test::WWW::Mechanize::VERSION, with WWW::Mechanize $WWW::Mechanize::VERSION, LWP $LWP::VERSION, Test::More $Test::More::VERSION, Perl $], $^X" );

for my $module ( qw( HTML::Lint HTML::Tidy5 ) ) {
    my $rc = eval "use $module; 1;";
    if ( $rc ) {
        no strict 'refs';
        my $version = ${"${module}::VERSION"};
        diag( "Found $module $version" );
    }
    else {
        diag( "No $module found." );
    }
}

done_testing();
