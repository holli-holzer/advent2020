say "puzzle.input"
	.IO
	.lines( :nl-in("\n\n") )
	.map( *.comb( /\N/ ).unique.elems )
	.sum