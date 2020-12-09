my @forest = "puzzle.input".IO.lines.map: *.comb;
my $height = +@forest;
my $width  = +@forest[0];

sub trees( @slope ( $b, $a ) ) {
    + grep { @forest[ .[0]; .[1] % $width ] ~~ '#' }, [Z] ( $a, $a*2 ...^ * >= $height  ), ( $b, $b*2 ... * ) }

say [*] map &trees, (3,1), (1,1), (5,1), (7,1), (1,2);

