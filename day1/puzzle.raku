say [*] flat "puzzle.input"
	.IO
	.lines
	.combinations(2)
	.grep: 2020 == *.sum;