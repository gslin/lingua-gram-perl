#!perl -T

use Lingua::Gram;
use Test::More;

my $str = 'Redistribution and use in source and binary forms, ';
my $g = Lingua::Gram->new($str);

is($g->unigram, 8);
is($g->bigram, 7);
is($g->gram(3), 6);

done_testing;
