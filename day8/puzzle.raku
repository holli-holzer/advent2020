my @program = "puzzle.input".IO.lines;

say run(-1);

for (0..^@program).grep({ @program[$_] ~~ /nop|jmp/ })
{
    .say and exit if run $_
}

sub run( $modify )
{
    my $acc = 0;
    my $pos = 0;
    my %ran;

    loop {
        my $command = @program[$pos];

        if $modify == $pos
        {
            if    $command ~~ /jmp/ { $command = $command.subst("jmp", "nop") }
            elsif $command ~~ /nop/ { $command = $command.subst("nop", "jmp") }
        }

        return $acc but False
            if %ran{ $pos };

        %ran{ $pos } = True;

        given $command {
            when /nop (.+)/ { $pos++; }
            when /acc (.+)/ { $pos++; $acc += $/[0] }
            when /jmp (.+)/ { $pos += $/[0] }
        }

       return $acc
          if $pos > @program - 1;
    }
}