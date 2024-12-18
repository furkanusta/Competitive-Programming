use regex::Regex;
use std::fs;

fn main() {
    let data = fs::read_to_string("data/3.inp").expect("Cannot read");
    let re = Regex::new(r"mul\((\d{1,3}),(\d{1,3})\)").unwrap();

    let mut sum = 0;
    for (_, [left, right]) in re.captures_iter(&data).map(|c| c.extract()) {
        sum += left.parse::<i32>().unwrap() * right.parse::<i32>().unwrap();
    }
    println!("{}", sum);
}
