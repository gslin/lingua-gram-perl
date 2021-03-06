#!perl -T

use Lingua::Gram;
use Test::More;
use utf8;

my $str = '中文測試';
my $g = Lingua::Gram->new($str);

is($g->unigram, 4);
is($g->bigram, 3);
is($g->gram(3), 2);

done_testing;
