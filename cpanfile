requires 'Carp';
requires 'Config';
requires 'Data::Dumper';
requires 'Exporter';
requires 'File::Basename';
requires 'File::Copy';
requires 'File::Find';
requires 'File::Spec';
requires 'File::Temp';
requires 'Getopt::Long';
requires 'IPC::Run3';
requires 'Markdown::Pod';
requires 'PPI';
requires 'perl', '5.008';
requires 'strict';
requires 'vars';
requires 'warnings';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
    requires 'perl', '5.008';
    requires 'version';
    suggests 'ASPEER::MakeMaker::Markdown::Pod';
};

on test => sub {
    requires 'File::Path';
    requires 'File::Temp';
    requires 'Test::More';
};
