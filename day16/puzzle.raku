unit sub MAIN( $input = "puzzle.input" );

my $input-data  = $input.IO.lines( :nl-in("\n\n") );
my %range-data  = $input-data[0].&parse-ranges;
my $my-ticket   = $input-data[1].lines[1].&parse-ints;
my @tickets     = $input-data[2].lines[1..*].map: *.&parse-ints;
my @all-ranges  = %range-data.values.map: |*;
my @all-numbers = |@tickets.map: |*;
my @bad-numbers = @all-numbers.grep: not * (elem) any @all-ranges;

# Part 1
say [+] @bad-numbers;

my @good-tickets = @tickets.grep( @bad-numbers.none == *.any );
my @pos-numbers  = [];

for @good-tickets -> $ticket {
	my $n = 0;
	for @$ticket {
		@pos-numbers[$n++].push: $_;
	}
}

my @known-fields = [];

while %range-data.keys {
	my $pos = 0;

	for @pos-numbers -> $numbers {
		my @found = %range-data.kv.map( -> $field, $ranges {
			$field if $numbers.all (elem) $ranges.any
		});

		if @found.elems == 1 {
			say "found @found[0] at $pos";
			@known-fields[$pos] = @found[0];
			%range-data{ @found[0] }:delete;
		}
		$pos++;
	}
}

my @departure-fields-idx = @known-fields.kv.map( -> $pos, $field {
	$pos if $field.starts-with('departure') } );

# Part 2
say [*] $my-ticket[ @departure-fields-idx ];

sub parse-ints( $data ) {
	[ $data.split(',')>>.Int ]
};

sub parse-ranges( $data ) {
	$data.lines.map: {
		my ($range-name, $rest) = .split( ": " );
		$range-name => $rest.split(" or ").map({
			Range.new( |.split( '-' ).map( *.Int ) )
		}).Array;
	}
}