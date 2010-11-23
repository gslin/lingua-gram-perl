#!perl -T

use Lingua::Gram;
use Test::More tests => 3;

my $str = 'Redistribution and use in source and binary forms, ';
my $g = Lingua::Gram->new($str);

is($g->unigram, 8);
is($g->bigram, 7);
is($g->gram(3), 6);
