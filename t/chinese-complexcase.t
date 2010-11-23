#!perl -T

use Lingua::Gram;
use Test::More tests => 3;
use utf8;

my $str = '中文測試，含標點符號,也包括了中英文大小寫 以及 空白。';
my $g = Lingua::Gram->new($str);

is($g->unigram, 23);
is($g->bigram, 22);
is($g->gram(3), 21);
