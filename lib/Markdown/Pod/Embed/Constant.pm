package Markdown::Pod::Embed::Constant;
use strict;
use warnings;
use File::Spec;
use Config;
use Exporter;
use vars qw(@ISA @EXPORT $OPTION_HR $PANDOC_EXE $PANDOC_CMD_MD2TEXT_CR);
@ISA=qw(Exporter);
@EXPORT=qw($OPTION_HR $PANDOC_EXE $PANDOC_CMD_MD2TEXT_CR);
$OPTION_HR={dialect => 'GitHub'};
$PANDOC_EXE='';
foreach my $dir (File::Spec->path()) {
    foreach my $name ('pandoc', 'pandoc.exe') {
        my $fn=File::Spec->catfile($dir, $name);
        if (-f $fn && -x $fn) { $PANDOC_EXE=$fn; last }
    }
    last if $PANDOC_EXE;
}
$PANDOC_CMD_MD2TEXT_CR=sub {
    return [shift(), '-f', 'gfm', '-t', 'plain', shift()];
};
1;
