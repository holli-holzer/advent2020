my @rules = "puzzle.input"
	.IO
	.lines
	.map: *.comb(/ \w+ \s \w+ <?before " bag"> /);

my &bags  = -> $color {
	flat map {
		.[0], .[0].&bags if $color ∈ .[1..*]
	}, @rules };

say + unique bags "shiny gold";

dd @rules;