fn main() {
    if let Ok(lines) = aoc24::read_lines("data/1.inp") {
        let lines: Vec<_> = lines.flatten().collect();
        let mut left : Vec<_> = lines.iter().map(|x| x.split_once(' ').unzip().0.expect("Split").trim().parse::<i32>().expect("Parse")).collect::<Vec<_>>();
        let mut right: Vec<_> = lines.iter().map(|x| x.split_once(' ').unzip().1.expect("Split").trim().parse::<i32>().expect("Parse")).collect::<Vec<_>>();
        left.sort();
        right.sort();
        let diff: Vec<_> = left.iter().zip(right.iter()).map(|x| (x.0 - x.1).abs()).collect();
        let total_diff: i32 = diff.iter().sum();
        println!("{}", total_diff);
    }
}
