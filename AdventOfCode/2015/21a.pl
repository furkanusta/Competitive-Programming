use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;
use POSIX;

open (my $file, '<', '21.inp');
<$file> =~ /Hit Points: (\d+)/;
my $boss_hp = $1;
<$file> =~ /Damage: (\d+)/;
my $boss_damage = $1;
<$file> =~ /Armor: (\d+)/;
my $boss_armor = $1;

sub can_beat {
    my $hp = 100;
    my $damage = shift;
    my $armor = shift;
    my $attack = $damage - $boss_armor;
    my $boss_attack = $boss_damage - $armor;
    $attack = 1 if $attack < 1;
    $boss_attack = 1 if $boss_attack < 1;
    my $count = ceil($boss_hp / $attack);
    my $boss_count = ceil($hp / $boss_attack);
    return $count <= $boss_count;
};

my ($hp, $damage, $armor) = qw(0 0 0);

my %weapons = (
    Dagger => [8, 4, 0],
    Shortsword => [10, 5, 0],
    Warhammer => [25, 6, 0],
    Longsword => [40, 7, 0],
    Greataxe => [74, 8, 0]
);

my %armors = (
    None => [0, 0, 0],
    Leather => [13, 0, 1],
    Chainmail => [31, 0, 2],
    Splintmail => [53, 0, 3],
    Bandedmail => [75, 0, 4],
    Platemail => [102, 0, 5]
);

my %rings = (
    "None" => [0, 0, 0],
    "Damage +1" => [25, 1, 0],
    "Damage +2" => [50, 2, 0],
    "Damage +3" => [100, 3, 0],
    "Defense +1" => [20, 0, 1],
    "Defense +2" => [40, 0, 2],
    "Defense +3" => [80, 0, 3]
);

my $ans = 2147483647;
for my $weapon (values %weapons) {
    for my $armor (values %armors) {
        for my $r1 (keys %rings) {
            for my $r2 (keys %rings) {
                next if ($r1 eq $r2) and $r1 ne "None";
                my $ring1 = $rings{$r1};
                my $ring2 = $rings{$r2};
                my $cost = $weapon->[0] + $armor->[0] + $ring1->[0] + $ring2->[0];
                my $my_damage = $weapon->[1] + $armor->[1] + $ring1->[1] + $ring2->[1];
                my $my_armor = $weapon->[2] + $armor->[2] + $ring1->[2] + $ring2->[2];
                if (can_beat($my_damage, $my_armor)) {
                    $ans = $cost < $ans ? $cost : $ans;
                }
            }
        }
    }
}
say $ans;
