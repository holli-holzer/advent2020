my @numbers = "puzzle.input".IO.lines.map: *.Int;

my $invalid = find-invalid;
say "Invalid: $invalid";

my $weakness = break-weakness $invalid;
say "Weakness: $weakness";

sub break-weakness ( $invalid )
{
    my @contiguous;

    for ^@numbers -> $i {
        return @contiguous.min + @contiguous.max
            if @contiguous = find-contiguous( $i, $invalid);
    }

    return -1;
}

sub find-contiguous( $i is copy, $invalid )
{
    my $sum;
    my @result;

    loop {
        $sum += @numbers[++$i];
        @result.push: @numbers[$i];
        return @result if $sum == $invalid;
        return [] if $sum > $invalid || $i > @numbers.end;
    }
}

sub find-invalid
{
    my $it = @numbers.iterator;
    my @stack;

    @stack.push( $it.pull-one ) for 0..24;

    while not ( my $val = $it.pull-one ) =:= IterationEnd
    {
        my $found = False;

        for @stack X @stack -> ($a, $b) {
            $found = True if $a + $b == $val && $a != $b }

        return $val unless $found;

        @stack.shift;
        @stack.push: $val;
    }

    return -1;
}