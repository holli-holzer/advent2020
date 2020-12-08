my @forest = "puzzle.input".IO.lines.map: *.comb;
my $height = +@forest;
my $width  = +@forest[0];
my @coords = 1 ..^ $height Z ( 3, 6 ... * ) ;
say +@coords.grep: { @forest[ .[0]; .[1] % $width ] ~~ '#' };  


