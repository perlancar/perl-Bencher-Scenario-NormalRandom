package Bencher::Scenario::NormalRandom;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark generating normally distributed random numbers',
    description => <<'_',

Each participant generates 1000 random numbers that are normally distributed. If
a module accepts a range, we use [0, 1]. If a module accepts distribution
parameters mean and standard deviation, we use 0.5 and 0.25 respectively.

_
    participants => [
        {
            module => 'Math::Random::GaussianRange',
            code_template => 'Math::Random::GaussianRange::generate_normal_range({min=>0, max=>1, n=>1000, round=>0})',
        },
        {
            module => 'Math::Random::NormalDistribution',
            code_template => 'my $gen = Math::Random::NormalDistribution::rand_nd_generator(0.5, 0.25); [map {$gen->()} 1..1000]',
        },
        {
            module => 'Math::Random::OO::Normal',
            code_template => 'my $oo = Math::Random::OO::Normal->new(0.5, 0.25); [map {$oo->next} 1..1000]',
        },
    ],
};

1;
# ABSTRACT:
