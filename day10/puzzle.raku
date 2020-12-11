my @w = 1, 1, 2, 4, 7;
my @j = "puzzle.input".IO.lines.map( *.Int ).sort;
my @d = ( 0, |@j, @j[*-1] + 3 ).rotor( 2 => -1 ).map: { [-] .reverse };
say [*] @d.Bag.values;
say [*] ( -1, |@d.grep: * == 3, :k )
    .rotor( 2 => -1 )
    .map: { @w[ .[1] - .[0] -1 ] };