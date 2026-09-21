# Markdown::Pod::Embed

Maintain Perl documentation in Markdown and merge its POD rendering into the
source file. A nonempty sidecar such as `lib/Example.pm.md` takes precedence;
otherwise embedded Markdown is used. Existing plain POD is preserved.

## Install and use

Install the distribution and its CPAN prerequisites with `cpanm .`. Pandoc is
also needed if you call the Markdown-to-text method.

```sh
markpod --dry-run --recursive lib
markpod --inplace --nobackup --recursive lib bin
markpod --extract-markdown lib/Example.pm
```

Without `--inplace`, the transformed source is printed to standard output.
Dry-run reports changes without writing files. Failures exit nonzero.

```perl
use Markdown::Pod::Embed;
my $processor_or=Markdown::Pod::Embed->new({nobackup => 1});
$processor_or->update('lib/Example.pm');
```

See [the API documentation](lib/Markdown/Pod/Embed.pm.md) and
[the examples](examples/README.md). From a checkout, run `prove -lr t`.

This distribution supplies the processor and `markpod`. Repository targets and
licence maintenance are provided by ASPEER::MakeMaker::Markdown::Pod.

After ASPEER::MakeMaker::Markdown::Pod is installed, rerun
`perl Makefile.PL` to enable this distribution's own `make doc` targets.
