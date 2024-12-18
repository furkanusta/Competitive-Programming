use regex::Regex;
use std::fs;

fn main() {
    let data = fs::read_to_string("data/4.inp").expect("Cannot read");
    let re = Regex::new(r"do\(\)|don't\(\)|mul\((\d{1,3}),(\d{1,3})\)").unwrap();

    let mut sum = 0;
    let mut mul_active = 1;

    for capture in re.captures_iter(&data) {
        let instr = capture.get(0).expect("No capture").as_str();
        if instr == "do()" {
            mul_active = 1;
        } else if instr == "don't()" {
            mul_active = 0;
        } else if mul_active == 1 {
            let left = capture.get(1).expect("No capture").as_str().trim();
            let right = capture.get(2).expect("No capture").as_str().trim();
            sum += left.parse::<i32>().unwrap() * right.parse::<i32>().unwrap();
        }
    }
    println!("{}", sum);
}
