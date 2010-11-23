#!perl -T

use Lingua::Gram;
use Test::More tests => 3;
use utf8;

my $str = '中文測試';
my $g = Lingua::Gram->new($str);

is($g->unigram, 4);
is($g->bigram, 3);
is($g->gram(3), 2);
