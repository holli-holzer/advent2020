use MONKEY-SEE-NO-EVAL;
sub infix:<xplus>($a, $b) { $a + $b };
sub infix:<xmult>($a, $b) { $a * $b };
sub infix:<tplus>($a, $b) is tighter(&infix:<xmult>) { $a + $b };
given "puzzle.input".IO.lines.list {
	say [+] .map: { EVAL .trans: <* +> => <xplus xmult> };
	say [+] .map: { EVAL .trans: <* +> => <tplus xmult> };
}