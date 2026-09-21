package Markdown::Pod::Embed::Util;

use strict;
use warnings;
use Exporter;
use Carp qw(croak);
use Data::Dumper qw(Dumper);
use vars qw(@ISA @EXPORT $QUIET $VERBOSE $DEBUG);
@ISA=qw(Exporter);
@EXPORT=qw(err msg debug verbose slurp blurp Dumper quiet_enable verbose_enable debug_enable);

sub err { croak(sprintf(shift(), @_)) }
sub msg { print STDERR sprintf(shift(), @_), "\n" unless $QUIET }
sub debug { msg(@_) if $DEBUG }
sub verbose { msg(@_) if $VERBOSE }
sub quiet_enable { $QUIET=shift() }
sub verbose_enable { $VERBOSE=shift() }
sub debug_enable { $DEBUG=shift() }

sub slurp {
    my ($fn)=@_;
    open(my $input_fh, '<', $fn) || err("unable to read %s: %s", $fn, $!);
    binmode($input_fh);
    local $/;
    my $text=<$input_fh>;
    close($input_fh) || err("unable to close %s: %s", $fn, $!);
    return defined($text) ? $text : '';
}

sub blurp {
    my ($fn, $text)=@_;
    open(my $output_fh, '>', $fn) || err("unable to write %s: %s", $fn, $!);
    binmode($output_fh);
    print {$output_fh} $text or err("unable to write %s: %s", $fn, $!);
    close($output_fh) || err("unable to close %s: %s", $fn, $!);
    return 1;
}

1;
