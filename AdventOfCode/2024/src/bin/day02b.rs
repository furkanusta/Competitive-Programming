fn main() {
    if let Ok(lines) = aoc24::read_lines("data/2.inp") {
        let levels: i32 = lines.map(|line| {
            let levels: Vec<_> = line.expect("Line").trim().split_whitespace().map(|x| x.parse::<i32>().unwrap()).collect();
            let matches = (0..levels.len()).any(|i| {
                let levels = aoc24::all_but_one(&levels, i);
                let increasing = levels.windows(2).all(|x| x[1] >= x[0]);
                let decreasing = levels.windows(2).all(|x| x[1] <= x[0]);
                let diff_valid = levels.windows(2).all(|x| (1..=3).contains(&(x[1] - x[0]).abs()));
                let level_valid = diff_valid && (increasing || decreasing);
                level_valid
            });
            matches as i32
        }).sum();
        println!("{}", levels);
    }
}
