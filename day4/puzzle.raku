my $fields = Set.new: <byr ecl eyr hcl hgt iyr pid>;

say "puzzle.input"
	.IO
	.lines( :nl-in("\n\n") )
	.map( *.comb( / <[ a..z]>+ <?before ":"> / ).cache )
	.grep( *.grep( * (elem) $fields ) > 6 )
	.elems;