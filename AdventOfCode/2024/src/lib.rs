use std::fs::File;
use std::path::Path;
use std::io::{self, BufRead};

pub fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>> where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}

pub fn all_but_one<T: Clone>(arr: &Vec<T>, index_to_remove: usize) -> Vec<T> {
    if index_to_remove >= arr.len() {
        panic!("Index out of bounds");
    }
    arr.iter()
        .enumerate()
        .filter(|&(i, _)| i != index_to_remove)
        .map(|(_, val)| val.clone())
        .collect()
}
