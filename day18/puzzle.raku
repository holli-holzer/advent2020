use MONKEY-SEE-NO-EVAL;
sub infix:<xplus>($a, $b) { $a + $b };
sub infix:<xmult>($a, $b) { $a * $b };
sub infix:<tplus>($a, $b) is tighter(&infix:<xmult>) { $a + $b };
my @i = [ "puzzle.input".IO.lines ];
my @o = [ '+', '*' ];
say [+] @i.map: { EVAL .trans: @o => ['xplus', 'xmult'] };
say [+] @i.map: { EVAL .trans: @o => ['tplus', 'xmult'] };
