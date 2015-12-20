#
# Title: The Grid Search
# URL: https://www.hackerrank.com/challenges/the-grid-search
# Difficulty: Moderate
#
# It would have been easier, If I had done it with index instead of regex
#
use strict;
use warnings;

my ($r, $c, $t, $re);
my ($n, $m, $index);
my (@src, @arr);
OUTER:for my $i(1..int<>) {
    ($n, $m) = split / /, <>;
    chomp($src[$_ - 1] = <>) for(1..$n);
    ($r, $c) = split / /, <>;
    chomp($arr[$_ - 1] = <>) for(1..$r);
  INNER:for my $j(0..$n-$r) {
        while ($src[$j] =~ /$arr[0]/g) {
            $t = 1;
            $index = pos($src[$j]) - length($arr[0]);
            $re = "[0-9]{$index}" . $arr[1] . "[0-9]{" . ($m- pos $src[$j]) . "}";
            while($t < $r && $src[$j + $t] =~ /$re/) {
                $t++;
                $re = "[0-9]{$index}" . $arr[$t] . "[0-9]{" . ($m- pos $src[$j]) . "}";
            }
            if ($t == $r) {
                print "YES\n";
                next OUTER;
            }
        }
    }

    print "NO\n";
}
