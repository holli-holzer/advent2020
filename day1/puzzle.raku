say [*] flat "puzzle.input"
	.IO
	.lines
	.combinations(3)
	.grep: 2020 == *.sum;