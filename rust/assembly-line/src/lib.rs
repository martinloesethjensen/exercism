// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

const MAX_PRODUCTION: u8 = 221;

pub fn production_rate_per_hour(speed: u8) -> f64 {
    return match speed {
        1..=4 => speed as f64 * MAX_PRODUCTION as f64,
        5..=8 => (speed as f64 * 0.9) * MAX_PRODUCTION as f64,
        _ => (speed as f64 * 0.77) * MAX_PRODUCTION as f64
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (production_rate_per_hour(speed) / 60.0) as u32
}
