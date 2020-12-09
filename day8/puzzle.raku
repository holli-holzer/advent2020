my @program = "puzzle.input".IO.lines;

say runx( @program );
say first { runx( @program, $_ ) },
    grep { not @program[$_].starts-with: 'acc' }, ^@program;

sub runx( @program, $modify = -1 )
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