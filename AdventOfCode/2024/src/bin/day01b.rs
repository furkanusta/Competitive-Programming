use std::collections::HashMap;

fn main() {
    if let Ok(lines) = aoc24::read_lines("data/1.inp") {
        let lines: Vec<_> = lines.flatten().collect();
        let left : Vec<_> = lines.iter().map(|x| x.split_once(' ').unzip().0.expect("Split").trim().parse::<i32>().expect("Parse")).collect();
        let right: Vec<_> = lines.iter().map(|x| x.split_once(' ').unzip().1.expect("Split").trim().parse::<i32>().expect("Parse")).collect();

        let mut freq_right: HashMap<i32, i32> = HashMap::new();
        for item in right {
            let count = freq_right.entry(item).or_insert(0);
            *count += 1;
        }

        let mut total = 0;
        for item in left {
            let count = freq_right.entry(item).or_insert(0);
            total += *count * item;
        }

        println!("{}", total);
    }
}
