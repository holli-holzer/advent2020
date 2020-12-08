
say dr(0, 127, [ "FBFBBFF".comb ] );
say dc(0, 8, [ "RLR".comb ] );

sub dr( $from, $to, $chars )
{
	my $diff = ( $to - $from ) div 2;
	given $chars.first
	{
		when "F" { return dr $from, $to - $diff - 1, $chars[1..*] }
		when "B" { return dr $from + $diff + 1, $to, $chars[1..*] }
	}
	$to;
}

sub dc( $from, $to, $chars )
{
	my $diff = ( $to - $from ) div 2;
	given $chars.first
	{
		when "L" { return dc $from, $to - $diff - 1, $chars[1..*] }
		when "R" { return dc $from + $diff + 1, $to, $chars[1..*] }
	}
	$to;
}
