#!perl -T

use Lingua::Gram;
use Test::More tests => 4;

my $str = '';
my $g = Lingua::Gram->new($str);

isa_ok($g, 'Lingua::Gram');
can_ok($g, 'bigram');
can_ok($g, 'gram');
can_ok($g, 'unigram');
