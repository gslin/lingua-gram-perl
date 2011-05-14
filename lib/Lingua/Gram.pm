package Lingua::Gram;

use warnings;
use strict;

=head1 NAME

Lingua::Gram - N-Gram Alrogithm for Unicode String

=head1 DESCRIPTION

This module will use Perl's regular unicode expression to cut string, and calculate the N-Gram algorithm.

=head1 SYNOPSIS

    use Lingua::Gram;

    my $g = Lingua::Gram->new($string);

    my @unigramWords = $g->gram(1);
    # OR
    my @unigramWords = $g->unigram;

    my @bigramWords = $g->gram(2);
    # OR
    my @bigramWords = $g->bigram;

=head1 SUBROUTINES/METHODS

=head2 new

    my $g = Lingua::Gram->new($string);

Create an object that contains C<$string> as paring string.

=cut

sub new {
    my $self = shift;
    my $str = shift;

    $self = bless {}, $self;
    $self->_cut($str);

    return $self;
}

sub _cut {
    my $self = shift;
    my $str = shift;

    $self->{units} = [];

    foreach (split /(?:\p{C}|\p{M}|\p{P}|\{S}|\p{Z})+/, $str) {
        while (/([\p{Latin}\d]+|\S)/go) {
            push @{$self->{units}}, $1;
        }
    }
}

=head2 bigram

    $g->bigram;

Return a list which is generated by bigram algorithm. (Faster)

=cut

sub bigram {
    my $self = shift;
    my $c = shift;

    my @units = @{$self->{units}};

    my $num = scalar @units - 1;
    my @result;

    for (my $i = 0; $i < $num; $i++) {
        my $item = $units[$i] . $units[$i + 1];
        push @result, $item;
    }

    return @result;
}

=head2 gram

    $g->gram($num);

Return a list which is generated by C<$num>-gram algorithm.

=cut

sub gram {
    my $self = shift;
    my $c = shift;

    my @units = @{$self->{units}};

    my $num = scalar @units - $c + 1;
    my @result;

    for (my $i = 0; $i < $num; $i++) {
        my $item = join '', @units[$i .. $i + $c - 1];
        push @result, $item;
    }

    return @result;
}

=head2 unigram

    $g->unigram;

Return a list which is generated by unigram algorithm. (Faster)

=cut

sub unigram {
    my $self = shift;
    my $c = shift;

    return @{$self->{units}};
}

=head1 AUTHOR

Gea-Suan Lin, C<< <gslin at gslin.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2010, 2011 Gea-Suan Lin.

This software is released under 3-clause BSD license. See
L<http://www.opensource.org/licenses/bsd-license.php> for more
information.

=cut

1; # End of Lingua::Gram
