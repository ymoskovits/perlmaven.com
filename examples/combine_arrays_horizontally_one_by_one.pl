use strict;
use warnings;
use Text::CSV;

my @event_ids = (23, 785);
my @ip_addresses = ('1.1.1.1',  '2.2.2.2');
my @descriptions = ('First, message', 'Second, text');

my $filename = 'horizontal_arrays.csv';
open my $fh, ">:encoding(utf8)", $filename or die "Could not open '$filename' for writing: $!";
my $csv = Text::CSV->new ({ binary => 1, auto_diag => 1 });

for my $idx (0 .. scalar(@event_ids)-1) {
    $csv->say ($fh, [$event_ids[$idx], $ip_addresses[$idx], $descriptions[$idx]]);
}

close $fh or die "Error closing the file '$filename': $!";
