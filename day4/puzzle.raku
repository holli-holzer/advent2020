my $fields = Set.new: <byr ecl eyr hcl hgt iyr pid cid>;
my %rules =
	byr => { $_ ~~ / ^ \d ** 4 $ / && 1920 <= $_ <= 2002 },
	iyr => { $_ ~~ / ^ \d ** 4 $ / && 2010 <= $_ <= 2020 },
	eyr => { $_ ~~ / ^ \d ** 4 $ / && 2020 <= $_ <= 2030 },
	hgt => { $_ ~~ / ^ ( \d+ ) ( cm | in ) $ / && $/[1] eq "cm" ?? 150 <= $/[0] <= 193 !! 59 <= $/[0] <= 76 },
	hcl => { $_ ~~ / ^ "#" ( <[ 0..9 a..f]> ** 6 ) $ / },
	ecl => { $_ eq any <amb blu brn gry grn hzl oth> },
	cid => { True },
	pid =>  { $_ ~~ / ^ ( \d ** 9 ) $ / },
;

my @present = "puzzle.input"
	.IO
	.lines( :nl-in("\n\n") )
	.map( &record )
	.grep( &present );

my @valid = @present.grep: &valid;

sub record( $data ) {
	$data
		.lines
		.map( *.split: " " )
		.flat
		.map({ [ .split: ":" ] })
		.Array }

sub present( $record )
{
	my $missing = $fields (-) $record.map: *.first;
	$missing.elems == 0 ?? True !!
	$missing.elems == 1 ?? $missing[0] eq 'cid' !!
	False }

sub valid( $record )
{
	for @$record -> ($field, $value) {
		my &rule = %rules{ $field };
		return False unless &rule( $value );
	};

	True;
}

say +@present;
say +@valid;
