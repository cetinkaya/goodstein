// 2015 - Ahmet Cetinkaya

use std::num::pow;

fn increase_base_aux(number: uint, base: uint, i: uint, acc: uint) -> uint {
    if number == 0 {
        acc
    } else {
        increase_base_aux(number / base, base, i + 1, acc + (number % base) * pow(base+1, increase_base(i, base)))
    }
}

fn increase_base(number: uint, base: uint) -> uint {
    increase_base_aux(number, base, 0, 0)
}

fn iterate(number: uint, base: uint) -> uint {
    increase_base(number, base) - 1
}

fn goodstein_sequence(initial_number: uint, initial_base: uint) -> Vec<uint> {
    let mut seq: Vec<uint> = vec![];
    let mut number = initial_number;
    let mut base = initial_base;
    while number > 0 {
        seq.push(number);
        number = iterate(number, base);
        base +=1;
    }
    seq.push(number);
    seq
}

fn main() {
    // expecting to see 6 6 6 6 5 4 3 2 1 0
   
    for i in goodstein_sequence(6, 4).iter() {
        println!("{}", i);
    }
}
