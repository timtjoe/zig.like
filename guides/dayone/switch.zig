const category_id: u8 = 1;

const category_name = switch (category_id) {
  0 => "Numeric",
  1 => "Alpha",
  2...10 => "Special Range", //Inclusive range
  else => "Unknown"
};

// Multiple matches
const chars:  u16 = "abcdefghijklmnopqrstuvwxyz";

const alphabet = switch(chars){
  'a','e','i','o','u' => return .vowel,
  else => return .constant
};