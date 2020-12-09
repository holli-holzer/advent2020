for &some-answered, &all-answered -> &f {
	say [+] "puzzle.input"
		.IO
		.lines( :nl-in("\n\n") )
		.map: &f; }

sub some-answered( $data ) {
	+ unique $data.comb: /\N/ }

sub all-answered( $data ) {
	my $people = +$data.lines;
	my $answers = $data.comb( /\N/ ).Bag;
	+ $answers.keys.grep: { $answers{$_} == $people } }
