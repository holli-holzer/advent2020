my $parser = / 
    $<from> = [ \d+ ] \-
    $<to>   = [ \d+ ] \s
    $<char> = [ \w  ] \: \s
    $<pass> = [ \w+ ] 
/;

say elems "puzzle.input"
	.IO
	.lines
	.map( -> $line { $line ~~ $parser } )
	.grep( -> $match { [<=] $match<from>, $match<pass>.indices( $match<char> ), $match<to> });
