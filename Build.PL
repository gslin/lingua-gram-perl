use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Lingua::Gram',
    license             => 'perl',
    dist_author         => q{Gea-Suan Lin <gslin@gslin.org>},
    dist_version_from   => 'lib/Lingua/Gram.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Lingua-Gram-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
